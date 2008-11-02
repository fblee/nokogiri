
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
#     The "setValue()" method for an attribute creates a 
#   Text node with the unparsed content of the string.
#   Retrieve the attribute named "street" from the last 
#   child of of the fourth employee and assign the "Y&ent1;" 
#   string to its value attribute.  This value is not yet
#   parsed and therefore should still be the same upon
#   retrieval. This test uses the "getNamedItem(name)" method
#   from the NamedNodeMap interface.  
# @author NIST
# @author Mary Brady
# see[http://www.w3.org/TR/1998/REC-DOM-Level-1-19981001/level-one-core#ID-221662474]
# see[http://lists.w3.org/Archives/Public/www-dom-ts/2002Apr/0057.html]
##
DOMTestCase('attrcreatetextnode') do

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
    preload(contentType, "staff", true)
  end

  ###
  # Runs the test case.
  # @throws Throwable Any uncaught exception causes test to fail
  #
  def test_attrcreatetextnode
    doc = nil
    addressList = nil
    testNode = nil
    attributes = nil
    streetAttr = nil
    value = nil
    doc = load_document("staff", true)
      addressList = doc.getElementsByTagName("address")
      testNode = addressList.item(3)
      attributes = testNode.attributes()
      streetAttr = attributes.getNamedItem("street")
      streetAttr.value = "Y&ent1;"
      value = streetAttr.value()
      assert_equal("Y&ent1;", value, "value")
            value = streetAttr.nodeValue()
      assert_equal("Y&ent1;", value, "nodeValue")
            
  end

  ###
  # Gets URI that identifies the test.
  # @return uri identifier of test
  #
  def targetURI
    "http://www.w3.org/2001/DOM-Test-Suite/tests/Level-1/attrcreatetextnode"
  end
end

