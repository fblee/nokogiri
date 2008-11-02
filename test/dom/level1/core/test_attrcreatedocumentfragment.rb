
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
#     Attr nodes may be associated with Element nodes contained within a DocumentFragment.
#   Create a new DocumentFragment and add a newly created Element node(with one attribute).  
#   Once the element is added, its attribute should be available as an attribute associated 
#   with an Element within a DocumentFragment.
# @author NIST
# @author Mary Brady
# see[http://www.w3.org/TR/1998/REC-DOM-Level-1-19981001/level-one-core#ID-35CB04B5]
# see[http://www.w3.org/TR/1998/REC-DOM-Level-1-19981001/level-one-core#ID-F68F082]
# see[http://www.w3.org/TR/1998/REC-DOM-Level-1-19981001/level-one-core#ID-B63ED1A3]
##
DOMTestCase('attrcreatedocumentfragment') do

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
  def test_attrcreatedocumentfragment
    doc = nil
    docFragment = nil
    newOne = nil
    domesticNode = nil
    domesticAttr = nil
    attrs = nil
    attrName = nil
    appendedChild = nil
    doc = load_document("staff", true)
      docFragment = doc.createDocumentFragment()
      newOne = doc.createElement("newElement")
      newOne.setAttribute("newdomestic", "Yes")
      appendedChild = docFragment.appendChild(newOne)
      domesticNode = docFragment.firstChild()
      domesticAttr = domesticNode.attributes()
      attrs = domesticAttr.item(0)
      attrName = attrs.name()
      assert_equal("newdomestic", attrName, "attrCreateDocumentFragmentAssert")
            
  end

  ###
  # Gets URI that identifies the test.
  # @return uri identifier of test
  #
  def targetURI
    "http://www.w3.org/2001/DOM-Test-Suite/tests/Level-1/attrcreatedocumentfragment"
  end
end

