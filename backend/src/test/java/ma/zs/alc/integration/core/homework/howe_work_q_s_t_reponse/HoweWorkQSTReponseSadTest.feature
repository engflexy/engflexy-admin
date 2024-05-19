Feature: HoweWorkQSTReponse

  Background:
    #* call read('karate-config.js')
    #* call read('db_cleaner.js')

    * url howeWorkQSTReponseUrl
    * header Content-Type = 'application/json'

    * def postBody = read('HoweWorkQSTReponseSave.json')
    * def FindAllSchema = read('HoweWorkQSTReponseSchema.json')
    * def uuid = function() { return '' + java.util.UUID.randomUUID(); }
    * postBody.ref = uuid()

  @duplicate
  Scenario Outline: POST HoweWorkQSTReponse Twice with same ref - expect <responseCode> as response code
    * postBody.code = uniqueId
    * def count = db.readValue('select count(*) FROM howe_work_q_s_t_reponse')

    * path ''
    * header Authorization = 'Bearer ' + adminToken
    * request postBody
    * method POST
    * status <responseCode>
    * eval if(__num==1 && count != db.readValue('select count(*) FROM howe_work_q_s_t_reponse')) karate.fail("howe_work_q_s_t_reponse count values in DB are different")

    Examples:
      | responseCode |
      | 201          |
      | 226          |

  @getByIdNotFound
  Scenario: Fail - GetByID Not Found
    * path 'id', 99999999
    * header Authorization = 'Bearer ' + adminToken
    * method GET
    * status 404
    * match response.length == 0


  @saveWithoutBody
  Scenario: Fail - POST HoweWorkQSTReponse without Body
    * path ''
    * header Authorization = 'Bearer ' + adminToken
    * method POST
    * status 400
    * match response.error == "Bad Request"


  @saveWithoutAuthorization
  Scenario: Fail - POST HoweWorkQSTReponse without Authorization
    * path ''
    * header Authorization = 'Bearer unvalid'
    * request postBody
    * method POST
    * status 401


  @saveWithPatchMethod
  Scenario: Fail - Save HoweWorkQSTReponse with method PATCH
    * path ''
    * header Authorization = 'Bearer ' + adminToken
    * method PATCH
    * status 405
    * match response.error == "Method Not Allowed"
