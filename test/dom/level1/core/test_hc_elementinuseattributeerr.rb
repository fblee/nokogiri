
###
# This Ruby source file was generated by test-to-ruby.xsl
# and is a derived work from the source document.
# The source document contained the following notice:
=begin

Copyright (c) 2001-2003 World Wide Web Consortium,
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

require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', 'helper'))

###
#     The "setAttributeNode(newAttr)" method raises an 
#    "INUSE_ATTRIBUTE_ERR DOMException if the "newAttr" 
#    is already an attribute of another element.
# @author Curt Arnold
# see[http://www.w3.org/TR/1998/REC-DOM-Level-1-19981001/level-one-core#xpointer(id('ID-258A00AF')/constant[@name='INUSE_ATTRIBUTE_ERR'])]
# see[http://www.w3.org/TR/1998/REC-DOM-Level-1-19981001/level-one-core#ID-887236154]
# see[http://www.w3.org/TR/1998/REC-DOM-Level-1-19981001/level-one-core#xpointer(id('ID-887236154')/raises/exception[@name='DOMException']/descr/p[substring-before(.,':')='INUSE_ATTRIBUTE_ERR'])]
# see[http://www.w3.org/Bugs/Public/show_bug.cgi?id=244]
##
DOMTestCase('hc_elementinuseattributeerr') do

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
    preload(contentType, "hc_staff", true)
  end

  ###
  # Runs the test case.
  # @throws Throwable Any uncaught exception causes test to fail
  #
  def test_hc_elementinuseattributeerr
    doc = nil
    newAttribute = nil
    addressElementList = nil
    testAddress = nil
    newElement = nil
    attrAddress = nil
    appendedChild = nil
    setAttr1 = nil
    setAttr2 = nil
    doc = load_document("hc_staff", true)
      addressElementList = doc.getElementsByTagName("body")
      testAddress = addressElementList.item(0)
      newElement = doc.createElement("p")
      appendedChild = testAddress.appendChild(newElement)
      newAttribute = doc.createAttribute("title")
      setAttr1 = newElement.setAttributeNode(newAttribute)
      
    begin
      success = false;
      begin
        setAttr2 = testAddress.setAttributeNode(newAttribute)
      rescue Nokogiri::XML::DOMException => ex
        success = (ex.code == Nokogiri::XML::DOMException::INUSE_ATTRIBUTE_ERR)
      end 
      assert(success, "throw_INUSE_ATTRIBUTE_ERR")
    end

  end

  ###
  # Gets URI that identifies the test.
  # @return uri identifier of test
  #
  def targetURI
    "http://www.w3.org/2001/DOM-Test-Suite/tests/Level-1/hc_elementinuseattributeerr"
  end
end
