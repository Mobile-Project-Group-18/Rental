package com.rental

import android.content.Intent
import android.os.Bundle
import android.text.TextUtils
import android.view.View
import android.widget.Button
import android.widget.EditText
import android.widget.ImageView
import android.widget.LinearLayout
import android.widget.TextView
import com.wang.base.BaseActivity
import com.wang.config.Consts
import com.wang.db.MemberUserUtils
import com.wang.model.ResponseEntry
import com.wang.model.UserModel
import com.wang.util.LoadingDialog
import com.wang.util.ToastUtil
import net.tsz.afinal.http.AjaxParams

/**
 * 
 *
 * @author Wang Kui
 */
class LoginActivity : BaseActivity() {
    // title
    private var mTvTitle: TextView? = null

    // 
    private var mLoginNumber: EditText? = null

    // 
    private var mLoginPswd: EditText? = null

    // 
    private var mLogin: Button? = null
    private var mEnterpriseQuery: Button? = null
    private val mllTop: LinearLayout? = null
    private var mIvBack: ImageView? = null
    override fun onCreate(savedInstanceState: Bundle) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_login)
        initWidget()
    }

    /**
     * 
     */
    override fun initWidget() {
        mIvBack = findViewById(R.id.mIvBack) as ImageView
        mdialog = LoadingDialog(this, "���ڵ�¼")
        mTvTitle = findViewById(R.id.mTvTitle) as TextView
        mTvTitle!!.text = "��¼"
        mLoginNumber = findViewById(R.id.mLoginNumber) as EditText
        mLoginPswd = findViewById(R.id.mLoginPswd) as EditText
        mLogin = findViewById(R.id.mLogin) as Button
        mEnterpriseQuery = findViewById(R.id.mEnterpriseQuery) as Button
        // mLoginNumber.setInputType(EditorInfo.TYPE_CLASS_PHONE);
        // 
        mLogin!!.setOnClickListener(this)
        mEnterpriseQuery!!.setOnClickListener(this)
        // 
        mLoginNumber!!.setSelection(mLoginNumber!!.text.length)
        //		// mLoginNumber.setText("TEA20170123164556");
//		mLoginNumber.setText("15249245656");
//		mLoginPswd.setText("123456");
        mIvBack!!.visibility = View.GONE
        mIvBack!!.setOnClickListener(this)
    }

    override fun onClick(v: View) {
        when (v.id) {
            R.id.mLogin -> {
                if (TextUtils.isEmpty(mLoginNumber!!.text.toString())) {
                    ToastUtil.ShowCentre(this@LoginActivity, "�������ֻ�����")
                    return
                }
                if (TextUtils.isEmpty(mLoginPswd!!.text.toString())) {
                    ToastUtil.ShowCentre(this@LoginActivity, "�������¼����")
                    return
                }
                LoginUserPost(true)
            }

            R.id.mIvBack -> finish()
            R.id.mEnterpriseQuery -> {
                val mEnterpriseQuery = Intent(this@LoginActivity, RegisterCreatActivity::class.java)
                startActivity(mEnterpriseQuery)
            }

            else -> {}
        }
    }

    override fun initData() {}

    /**
     * 
     *
     * @param isShow
     */
    private fun LoginUserPost(isShow: Boolean) {
        val params = AjaxParams()
        params.put("action_flag", "login")
        params.put("uphone", mLoginNumber!!.text.toString())
        params.put("pswd", mLoginPswd!!.text.toString())
        httpPost(
            Consts.URL + Consts.APP.RegisterAction,
            params,
            Consts.actionId.resultFlag,
            isShow,
            "���ڵ�¼..."
        )
    }

    override fun callBackSuccess(entry: ResponseEntry, actionId: Int) {
        super.callBackSuccess(entry, actionId)
        when (actionId) {
            Consts.actionId.resultFlag -> if (null != entry.data && !TextUtils.isEmpty(entry.data)) {
                val userModel = mGson.fromJson(entry.data, UserModel::class.java)
                MemberUserUtils.setUid(this@LoginActivity, userModel.uid)
                MemberUserUtils.setName(this@LoginActivity, userModel.uname)
                MemberUserUtils.putBean(this@LoginActivity, "user_messgae", userModel)
                val intent = Intent(this@LoginActivity, FrameworkActivity::class.java)
                startActivity(intent)
                finish()
            }
        }
    }

    override fun callBackAllFailure(strMsg: String, actionId: Int) {
        super.callBackAllFailure(strMsg, actionId)
        ToastUtil.show(this@LoginActivity, strMsg)
    }
}
