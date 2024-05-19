Feature: ClassAverageBonusProf

  Background:
    #* call read('karate-config.js')
    #* call read('db_cleaner.js')

    * url classAverageBonusProfUrl
    * header Content-Type = 'application/json'

    * def postBody = read('ClassAverageBonusProfSave.json')
    * def FindAllSchema = read('ClassAverageBonusProfSchema.json')

  @getByIdNotFound
  Scenario: Fail - GetByID Not Found
    * path 'id', 99999999
    * header Authorization = 'Bearer ' + adminToken
    * method GET
    * status 404
    * match response.length == 0


  @saveWithoutBody
  Scenario: Fail - POST ClassAverageBonusProf without Body
    * path ''
    * header Authorization = 'Bearer ' + adminToken
    * method POST
    * status 400
    * match response.error == "Bad Request"


  @saveWithoutAuthorization
  Scenario: Fail - POST ClassAverageBonusProf without Authorization
    * path ''
    * header Authorization = 'Bearer unvalid'
    * request postBody
    * method POST
    * status 401


  @saveWithPatchMethod
  Scenario: Fail - Save ClassAverageBonusProf with method PATCH
    * path ''
    * header Authorization = 'Bearer ' + adminToken
    * method PATCH
    * status 405
    * match response.error == "Method Not Allowed"
