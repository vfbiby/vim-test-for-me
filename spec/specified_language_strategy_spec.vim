source spec/support/helpers.vim

describe "Jest"

  before
    cd spec/fixtures/jest
    function! TermStrategy(cmd)
    endfunction

    function! JsTermStrategy(cmd)
        let g:test#last_command = 'specified language runner strategy'
    endfunction

  end

  after
    call Teardown()
    cd -
  end

  it "can specified language-runner strategy"
    let g:test#custom_strategies = {'termOpen': function('TermStrategy'), 'jsTermOpen': function('JsTermStrategy')}
    let g:test#strategy = 'termOpen'
    let g:test#javascript#jest#strategy = 'jsTermOpen'

    view +1 __tests__/normal-test.js
    TestNearest

    Expect g:test#last_command == 'specified language runner strategy'
  end
end
