package egovframework.example.sample.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.example.sample.service.SampleService;

@Service("sampleServe")
public class SampleServiceImpl implements SampleService{

	/** EgovSampleService */
	@Resource(name = "sampleServeMapper")
	private SampleServiceMapper sampleServeMapper;
	
	@Override
	public String selectHello() {
		return sampleServeMapper.sampleSearch();
	}

}
