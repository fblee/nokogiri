
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
#     The "createEntityReference(name)" method creates an 
#    EntityReference node.  In addition, if the referenced entity
#    is known, the child list of the "EntityReference" node
#    is the same as the corresponding "Entity" node.
#    
#    Retrieve the entire DOM document and invoke its 
#    "createEntityReference(name)" method.  It should create 
#    a new EntityReference node for the Entity with the 
#    given name.  The referenced entity is known, therefore the child
#    list of the "EntityReference" node is the same as the corresponding
#    "Entity" node.
# @author NIST
# @author Mary Brady
# see[http://www.w3.org/TR/1998/REC-DOM-Level-1-19981001/level-one-core#ID-392B75AE]
##
DOMTestCase('documentcreateentityreferenceknown') do

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
  def test_documentcreateentityreferenceknown
    doc = nil
    newEntRefNode = nil
    newEntRefList = nil
    child = nil
    name = nil
    value = nil
    doc = load_document("staff", true)
      newEntRefNode = doc.createEntityReference("ent3")
      assert_not_nil(newEntRefNode, "createdEntRefNotNull")
      newEntRefList = newEntRefNode.childNodes()
      assertSize("size", 1, newEntRefList)
      child = newEntRefNode.firstChild()
      name = child.nodeName()
      assert_equal("#text", name, "name")
            value = child.nodeValue()
      assert_equal("Texas", value, "value")
            
  end

  ###
  # Gets URI that identifies the test.
  # @return uri identifier of test
  #
  def targetURI
    "http://www.w3.org/2001/DOM-Test-Suite/tests/Level-1/documentcreateentityreferenceknown"
  end
end

