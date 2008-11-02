
###
# This Ruby source file was generated by test-to-ruby.xsl
# and is a derived work from the source document.
# The source document contained the following notice:
=begin

Copyright (c) 2001 World Wide Web Consortium,
(Massachusetts Institute of Technology, Institut National de
Recherche en Informatique et en Automatique, Keio University). All
Rights Reserved. This program is distributed under the W3C's Software
Intellectual Property License. This program is distributed in the
hope that it will be useful, but WITHOUT ANY WARRANTY; without even
the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
PURPOSE.
See W3C License http://www.w3.org/Consortium/Legal/ for more details.

=end
#

require 'dom_test_case'

###
#     The string returned by the "getNodeName()" method for a 
#     Text Node is "#text".
#     
#     Retrieve the Text Node from the last child of the
#     first employee and check the string returned 
#     by the "getNodeName()" method.   It should be equal to 
#     "#text". 
# @author NIST
# @author Mary Brady
# see[http://www.w3.org/TR/1998/REC-DOM-Level-1-19981001/level-one-core#ID-F68D095]
##
DOMTestCase('nodetextnodename') do

  ###
  # Constructor.
  # @param factory document factory, may not be null
  # @throws org.w3c.domts.DOMTestIncompatibleException Thrown if test is not compatible with parser configuration
  ##
  def setup
    ##
    ##   check if loaded documents are supported for content type
    ##
    contentType = getContentType()
    preload(contentType, "staff", false)
  end

  ###
  # Runs the test case.
  # @throws Throwable Any uncaught exception causes test to fail
  #
  def test_nodetextnodename
    doc = nil
    elementList = nil
    testAddr = nil
    textNode = nil
    textName = nil
    doc = load_document("staff", false)
      elementList = doc.getElementsByTagName("address")
      testAddr = elementList.item(0)
      textNode = testAddr.firstChild()
      textName = textNode.nodeName()
      assert_equal("#text", textName, "nodeTextNodeNameAssert1")
            
  end

  ###
  # Gets URI that identifies the test.
  # @return uri identifier of test
  #
  def targetURI
    "http://www.w3.org/2001/DOM-Test-Suite/tests/Level-1/nodetextnodename"
  end
end

