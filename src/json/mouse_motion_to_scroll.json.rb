#!/usr/bin/env ruby

# You can generate json by executing the following command on Terminal.
#
# $ ruby ./mouse_motion_to_scroll.json.rb
#

############################################################

require 'json'
require_relative '../lib/karabiner.rb'

def main
  puts JSON.pretty_generate(
    'title' => 'Mouse motion to scroll (rev 1)',
    'maintainer' => 'tekezo',
    'rules' => [
      {
        'description' => 'Change button4 + mouse motion to scroll wheel (rev 1) (Available since Karabiner-Elements v12.2.6)',
        'manipulators' => [
          {
            'type' => 'basic',
            'from' => {
              'pointing_button' => 'button4',
              'modifiers' => {
                'optional' => [
                  'any',
                ],
              },
            },
            'to' => [
              Karabiner.set_variable('enable_mouse_motion_to_scroll', 1),
            ],
            'to_after_key_up' => [
              Karabiner.set_variable('enable_mouse_motion_to_scroll', 0),
            ],
          },
          {
            'type' => 'mouse_motion_to_scroll',
            'from' => {
              'modifiers' => {
                'optional' => [
                  'any',
                ],
              },
            },
            'conditions' => [
              Karabiner.variable_if('enable_mouse_motion_to_scroll', 1),
            ],
          },
        ].flatten,
      },
      {
        'description' => 'Change button5 + mouse motion to scroll wheel (rev 1) (Available since Karabiner-Elements v12.2.6)',
        'manipulators' => [
          {
            'type' => 'basic',
            'from' => {
              'pointing_button' => 'button5',
              'modifiers' => {
                'optional' => [
                  'any',
                ],
              },
            },
            'to' => [
              Karabiner.set_variable('enable_mouse_motion_to_scroll', 1),
            ],
            'to_after_key_up' => [
              Karabiner.set_variable('enable_mouse_motion_to_scroll', 0),
            ],
          },
          {
            'type' => 'mouse_motion_to_scroll',
            'from' => {
              'modifiers' => {
                'optional' => [
                  'any',
                ],
              },
            },
            'conditions' => [
              Karabiner.variable_if('enable_mouse_motion_to_scroll', 1),
            ],
          },
        ].flatten,
      },
      {
        'description' => 'Change control + mouse motion to scroll wheel (rev 1) (Available since Karabiner-Elements v12.2.6)',
        'manipulators' => [
          {
            'type' => 'mouse_motion_to_scroll',
            'from' => {
              'modifiers' => {
                'mandatory' => ['control'],
              },
            },
          },
        ].flatten,
      },
    ]
  )
end

main
