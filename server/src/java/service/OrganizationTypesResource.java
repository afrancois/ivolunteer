/*
 *  OrganizationTypesResource
 *
 * Created on October 11, 2008, 9:18 PM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package service;

import java.util.Collection;
import javax.ws.rs.Path;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.ProduceMime;
import javax.ws.rs.ConsumeMime;
import javax.ws.rs.PathParam;
import javax.ws.rs.QueryParam;
import javax.ws.rs.DefaultValue;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.UriInfo;
import persistence.OrganizationTypes;
import persistence.Organizations;
import converter.OrganizationTypesConverter;
import converter.OrganizationTypeConverter;


/**
 *
 * @author dave
 */

@Path("/organizationTypes/")
public class OrganizationTypesResource {
    @Context
    private UriInfo context;
  
    /** Creates a new instance of OrganizationTypesResource */
    public OrganizationTypesResource() {
    }

    /**
     * Constructor used for instantiating an instance of dynamic resource.
     *
     * @param context HttpContext inherited from the parent resource
     */
    public OrganizationTypesResource(UriInfo context) {
        this.context = context;
    }

    /**
     * Get method for retrieving a collection of OrganizationTypes instance in XML format.
     *
     * @return an instance of OrganizationTypesConverter
     */
    @GET
    @ProduceMime({"application/xml", "application/json"})
    public OrganizationTypesConverter get(@QueryParam("start")
    @DefaultValue("0")
    int start, @QueryParam("max")
    @DefaultValue("10")
    int max) {
        try {
            return new OrganizationTypesConverter(getEntities(start, max), context.getAbsolutePath());
        } finally {
            PersistenceService.getInstance().close();
        }
    }

    /**
     * Post method for creating an instance of OrganizationTypes using XML as the input format.
     *
     * @param data an OrganizationTypeConverter entity that is deserialized from an XML stream
     * @return an instance of OrganizationTypeConverter
     */
    @POST
    @ConsumeMime({"application/xml", "application/json"})
    public Response post(OrganizationTypeConverter data) {
        PersistenceService persistenceSvc = PersistenceService.getInstance();
        try {
            persistenceSvc.beginTx();
            OrganizationTypes entity = data.getEntity();
            createEntity(entity);
            persistenceSvc.commitTx();
            return Response.created(context.getAbsolutePath().resolve(entity.getId() + "/")).build();
        } finally {
            persistenceSvc.close();
        }
    }

    /**
     * Returns a dynamic instance of OrganizationTypeResource used for entity navigation.
     *
     * @return an instance of OrganizationTypeResource
     */
    @Path("{id}/")
    public OrganizationTypeResource getOrganizationTypeResource(@PathParam("id")
    String id) {
        return new OrganizationTypeResource(id, context);
    }

    /**
     * Returns all the entities associated with this resource.
     *
     * @return a collection of OrganizationTypes instances
     */
    protected Collection<OrganizationTypes> getEntities(int start, int max) {
        return PersistenceService.getInstance().createQuery("SELECT e FROM OrganizationTypes e").setFirstResult(start).setMaxResults(max).getResultList();
    }

    /**
     * Persist the given entity.
     *
     * @param entity the entity to persist
     */
    protected void createEntity(OrganizationTypes entity) {
        PersistenceService.getInstance().persistEntity(entity);
        for (Organizations value : entity.getOrganizationsCollection()) {
            value.setOrganizationTypeId(entity);
        }
    }
}
