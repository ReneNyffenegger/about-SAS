#!/usr/bin/perl
#
#   Compare
#        An Animated Guide: The Map of the SAS® Macro Facility
#     by Russell Lavery,
#        Saad Anbari,
#        Musa Nsereko
#
use warnings;
use strict;
use utf8;

use GraphViz::Graph;

my $graph = GraphViz::Graph->new('compilation');

$graph->label({html=>"<font point-size='20'><b><font face='Courier'>SAS Compilation</font></b></font>"});


my $source_code               = NODE->new('Source code');
my $input_stack               = NODE->new('Input stack');
my $word_scanner_token_router = NODE->new('Word scanner/token router');
   $word_scanner_token_router->add_line('Assemble tokens from characters<br/>taken from input stack.');
   $word_scanner_token_router->add_line('Push Tokens to either<br/>Word Queue or Multi component<br/>macro processor.');

my $word_queue                = NODE->new('Word queue');
   $word_queue->add_line('Keeps up to 6 tokens');


my $mc_macro_processor        = NODE->new('Multi component macro processor');
   $mc_macro_processor->add_line('Invoked after macro triggers (<font face="Courier">%</font> or <font face="Courier">&amp;</font>)');


my $compiler = NODE->new('Compiler');
   $compiler -> add_line('Request tokens until <font face="Courier">quit, run, proc …</font>');
   $compiler -> add_line('Compile tokens into programm.');

my $execution = NODE->new('Execution');

my $macro_catalogue = NODE->new('Macro catalogue');
   $macro_catalogue->add_line('%macro tq84; ... %mend tq84;');

my $macro_table     = NODE->new('Macro table');
   $macro_table->add_line('(&amp;)foo=42<br/>(&amp;)bar=99<br/>');
  
NODE::edge($source_code, $input_stack);
NODE::edge($input_stack, $word_scanner_token_router);
NODE::edge($word_scanner_token_router, $word_queue);
NODE::edge($word_scanner_token_router, $mc_macro_processor);
NODE::edge($word_queue, $compiler);
NODE::edge($compiler, $execution);
NODE::edge($mc_macro_processor, $input_stack);

NODE::edge($mc_macro_processor, $macro_catalogue); # Macro compiliation
NODE::edge($macro_catalogue, $mc_macro_processor);

NODE::edge($mc_macro_processor, $macro_table); # %let foo=42
NODE::edge($macro_table, $mc_macro_processor);


NODE::create();



package NODE;


my @nodes;

sub new {

  my $class = shift;
  my $title = shift;
  my $self  = {};
  bless $self, $class;

  $self->{graphviz} = $graph->node();
  $self->{title   } = $title;
  $self->{lines   } = [];

  push @nodes, $self;

  return $self;

}

sub add_line {
  my $self = shift;
  my $text = shift;

  push @{$self->{lines}}, $text;

}

sub edge {

  my $node_from = shift;
  my $node_to   = shift;

  $graph->edge($node_from->{graphviz}, $node_to->{graphviz});

}

sub create {

  for my $node (@nodes) {

    my $html = qq{<table border="1" cellborder="0">
      <tr><td><b>$node->{title}</b></td></tr>};

      for my $line (@{$node->{lines}}) {

        $html .= "<tr><td>$line</td></tr>";

      }

    $html .= '</table>';

    $node->{graphviz}->label({html=>$html});


  }

  $graph->create('pdf');
}

1;
