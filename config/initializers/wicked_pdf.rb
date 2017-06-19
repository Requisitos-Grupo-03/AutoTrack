# WickedPDF Global Configuration
#
# Use this to set up shared configuration options for your entire application.
# Any of the configuration options shown here can also be applied to single
# models by passing arguments to the `render :pdf` call.
#
# To learn more, check out the README:
#
# https://github.com/mileszs/wicked_pdf/blob/master/README.md

# platform = RUBY_PLATFORM
#
# if platform.include?("darwin") # OS X machine
#   binary_path = Rails.root.join('bin', 'wkhtmltopdf-0.9.9-OS-X-i386').to_s
# elsif platform.include?("64-linux") # 64-bit linux machine
#   binary_path = Rails.root.join('bin', 'wkhtmltopdf-amd64').to_s
# end
#
# WickedPdf.config = { :exe_path => binary_path }
#
# WickedPdf.config = {
#   # Path to the wkhtmltopdf executable: This usually isn't needed if using
#   # one of the wkhtmltopdf-binary family of gems.
#   # exe_path: '/home/matheusrich/.rvm/gems/ruby-2.3.1@mds/gems/wkhtmltopdf-binary-0.12.3.1/bin/wkhtmltopdf',
#   #   or
#   exe_path: Gem.bin_path('wkhtmltopdf-binary', 'wkhtmltopdf')
#
#   # Layout file to be used for all PDFs
#   # (but can be overridden in `render :pdf` calls)
#   # layout: 'pdf.html',
# }
