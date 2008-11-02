
###
# This Ruby source file was generated by test-to-ruby.xsl
# and is a derived work from the source document.
# The source document contained the following notice:
=begin

Copyright (c) 2001-2004 World Wide Web Consortium,
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
#     If the node removed by the "removeNamedItem(name)" method 
#    is an Attr node with a default value it is immediately
#    replaced. 
#    
#    Retrieve the third employee and create a NamedNodeMap 
#    object of the attributes of the last child.  Once the
#    list is created invoke the "removeNamedItem(name)"
#    method with name="street".  The "removeNamedItem(name)"
#    method should remove the "street" attribute and since
#    it has a default value of "Yes", that value should
#    immediately be the attributes value.
# @author NIST
# @author Mary Brady
# see[http://www.w3.org/TR/1998/REC-DOM-Level-1-19981001/level-one-core#ID-D58B193]
# see[http://www.w3.org/TR/1998/REC-DOM-Level-1-19981001/level-one-core#ID-349467F9]
# see[http://lists.w3.org/Archives/Public/www-dom-ts/2002Mar/0002.html]
##
DOMTestCase('namednodemapremovenameditemgetvalue') do

  ###
  # Constructor.
  # @param factory document factory, may not be null
  # @throws org.w3c.domts.DOMTestIncompatibleException Thrown if test is not compatible with parser configuration
  ##
  def setup
=begin
      org.w3c.domts.DocumentBuilderSetting[] settings = 
          new org.w3c.domts.DocumentBuilderSetting[] {
org.w3c.domts.DocumentBuilderSetting.validating
        };
        DOMTestDocumentBuilderFactory testFactory = factory.newInstance(settings)
        setFactory(testFactory)
=end

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
  def test_namednodemapremovenameditemgetvalue
    doc = nil
    elementList = nil
    testEmployee = nil
    attributes = nil
    streetAttr = nil
    value = nil
    removedNode = nil
    doc = load_document("staff", true)
      elementList = doc.getElementsByTagName("address")
      testEmployee = elementList.item(2)
      attributes = testEmployee.attributes()
      assert_not_nil(attributes, "attributesNotNull")
      removedNode = attributes.removeNamedItem("street")
      streetAttr = attributes.getNamedItem("street")
      assert_not_nil(streetAttr, "streetAttrNotNull")
      value = streetAttr.value()
      assert_equal("Yes", value, "namednodemapRemoveNamedItemGetValueAssert")
            
  end

  ###
  # Gets URI that identifies the test.
  # @return uri identifier of test
  #
  def targetURI
    "http://www.w3.org/2001/DOM-Test-Suite/tests/Level-1/namednodemapremovenameditemgetvalue"
  end
end

