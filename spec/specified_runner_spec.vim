source spec/support/helpers.vim

describe "Jest"

  before
    cd spec/fixtures/mocha
  end

  after
    call Teardown()
    cd -
    unlet g:test#javascript#runner
  end

  it "runs file test if nearest test couldn't be found"
    let g:test#javascript#runner = 'jest'
    view +1 test/normal.spec.js
    normal O
    TestNearest

    Expect g:test#last_command == 'jest --no-coverage -- test/normal.spec.js'
  end
end
