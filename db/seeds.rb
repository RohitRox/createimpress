# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Boilerplate.delete_all
head = '<!DOCTYPE html><html><head><title>impress created by createimpress.herokuapp.com</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style type="text/css">
        .no-support-message { display:none; }
        .impress-not-supported .no-support-message { display:block; }
        body { background:#EBEBEB;}
        .step { width:940px; margin:0 auto 24px auto; text-align:center; }
        h1,h2,h3,h4,h5,h6{
        font-size:100%;
        }
        </style>
        </head>
        <body>
        <div id="impress">
        <div class="no-support-message">
        Your browser doesn\'t support impress.js.  Try Chrome or Safari.
        </div>'
base_file = " "
foot = '</div>
        <script type="text/javascript" src="impress.js"></script>
        <body>
        </html>'
Boilerplate.create!(:head => head, :base_file => base_file, :foot => foot)

