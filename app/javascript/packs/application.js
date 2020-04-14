// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("jquery")
require("@rails/activestorage").start()
require("channels")
require("moment/locale/ru")
require("tempusdominus-bootstrap-4")

import '../stylesheets/application'
import './bootstrap_custom.js'

$(document).on("turbolinks:load",function(){
  $('.datetimepicker').datetimepicker({
    locale: 'ru'
  });
})
