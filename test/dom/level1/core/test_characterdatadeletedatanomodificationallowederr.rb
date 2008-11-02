
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
#     The "deleteData(offset,count)" method raises a NO_MODIFICATION_ALLOWED_ERR 
#    DOMException if the node is readonly.   
#    Obtain the children of the THIRD "gender" element.  The elements
#    content is an entity reference.  Get the FIRST item 
#    from the entity reference and execute the "deleteData(offset,count)" method.
#    This causes a NO_MODIFICATION_ALLOWED_ERR DOMException to be thrown.
# @author NIST
# @author Mary Brady
# see[http://www.w3.org/TR/1998/REC-DOM-Level-1-19981001/level-one-core#xpointer(id('ID-258A00AF')/constant[@name='NO_MODIFICATION_ALLOWED_ERR'])]
# see[http://www.w3.org/TR/1998/REC-DOM-Level-1-19981001/level-one-core#ID-7C603781]
# see[http://www.w3.org/TR/1998/REC-DOM-Level-1-19981001/level-one-core#xpointer(id('ID-7C603781')/raises/exception[@name='DOMException']/descr/p[substring-before(.,':')='NO_MODIFICATION_ALLOWED_ERR'])]
# see[http://www.w3.org/TR/1998/REC-DOM-Level-1-19981001/level-one-core#ID-7C603781]
##
DOMTestCase('characterdatadeletedatanomodificationallowederr') do

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
  def test_characterdatadeletedatanomodificationallowederr
    doc = nil
    genderList = nil
    genderNode = nil
    entElement = nil
    entElementContent = nil
    nodeType = nil
    entReference = nil
    doc = load_document("staff", true)
      genderList = doc.getElementsByTagName("gender")
      genderNode = genderList.item(2)
      entReference = genderNode.firstChild()
      assert_not_nil(entReference, "entReferenceNotNull")
      nodeType = entReference.nodeType()
      
      if (equals(3, nodeType))
        entReference = doc.createEntityReference("ent4")
      assert_not_nil(entReference, "createdEntRefNotNull")
      
         end
       entElement = entReference.firstChild()
      assert_not_nil(entElement, "entElementNotNull")
      entElementContent = entElement.firstChild()
      assert_not_nil(entElementContent, "entElementContentNotNull")
      
    begin
      success = false;
      begin
        entElementContent.deleteData(1, 3)
      rescue Nokogiri::XML::DOMException => ex
        success = (ex.code == Nokogiri::XML::DOMException::NO_MODIFICATION_ALLOWED_ERR)
      end 
      assert(success, "throw_NO_MODIFICATION_ALLOWED_ERR")
    end

  end

  ###
  # Gets URI that identifies the test.
  # @return uri identifier of test
  #
  def targetURI
    "http://www.w3.org/2001/DOM-Test-Suite/tests/Level-1/characterdatadeletedatanomodificationallowederr"
  end
end

