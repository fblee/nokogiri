
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
#     The "getAttributes()" method invoked on an Element
#     Node returns a NamedNodeMap containing the attributes
#     of this node.
#     
#     Retrieve the last child of the third employee and
#     invoke the "getAttributes()" method.   It should return
#     a NamedNodeMap containing the attributes of the Element
#     node. 
# @author NIST
# @author Mary Brady
# see[http://www.w3.org/TR/1998/REC-DOM-Level-1-19981001/level-one-core#ID-84CF096]
##
DOMTestCase('nodeelementnodeattributes') do

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
  def test_nodeelementnodeattributes
    doc = nil
    elementList = nil
    testAddr = nil
    addrAttr = nil
    attrNode = nil
    attrName = nil
    attrList = []
      
    expected = []
      expected << "domestic"
      expected << "street"
      
    doc = load_document("staff", false)
      elementList = doc.getElementsByTagName("address")
      testAddr = elementList.item(2)
      addrAttr = testAddr.attributes()
      indexid5667962 = 0
    while (indexid5667962 < addrAttr.length)
      attrNode = addrAttr.item(indexid5667962)
    attrName = attrNode.nodeName()
      attrList << attrName
      indexid5667962 += 1
            end
      assert_equal(expected, attrList, "nodeElementNodeValueAssert1")
            
  end

  ###
  # Gets URI that identifies the test.
  # @return uri identifier of test
  #
  def targetURI
    "http://www.w3.org/2001/DOM-Test-Suite/tests/Level-1/nodeelementnodeattributes"
  end
end

