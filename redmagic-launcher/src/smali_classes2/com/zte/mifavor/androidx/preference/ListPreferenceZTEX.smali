.class public Lcom/zte/mifavor/androidx/preference/ListPreferenceZTEX;
.super Landroidx/preference/ListPreference;
.source "ListPreferenceZTEX.java"


# static fields
.field private static u0:Z


# instance fields
.field private final h0:Z

.field private i0:Ljava/lang/CharSequence;

.field private j0:Landroid/content/Context;

.field private k0:Landroid/widget/TextView;

.field private l0:Landroid/widget/TextView;

.field private m0:I

.field private n0:I

.field private o0:I

.field private p0:Z

.field private q0:Ljava/lang/String;

.field private r0:Z

.field private s0:Landroid/graphics/drawable/Drawable;

.field private t0:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/zte/mifavor/androidx/preference/ListPreferenceZTEX;->i1()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    sput-boolean v0, Lcom/zte/mifavor/androidx/preference/ListPreferenceZTEX;->u0:Z

    .line 6
    .line 7
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2

    .line 1
    invoke-static {p1, p2}, Lcom/zte/mifavor/androidx/preference/ListPreferenceZTEX;->l1(Landroid/content/Context;Landroid/util/AttributeSet;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    sget v0, LR3/c;->g:I

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    sget v0, LR3/c;->f:I

    .line 11
    .line 12
    :goto_0
    invoke-direct {p0, p1, p2, v0}, Landroidx/preference/ListPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 13
    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    iput-boolean v0, p0, Lcom/zte/mifavor/androidx/preference/ListPreferenceZTEX;->h0:Z

    .line 17
    .line 18
    const/4 v0, -0x1

    .line 19
    iput v0, p0, Lcom/zte/mifavor/androidx/preference/ListPreferenceZTEX;->m0:I

    .line 20
    .line 21
    iput v0, p0, Lcom/zte/mifavor/androidx/preference/ListPreferenceZTEX;->n0:I

    .line 22
    .line 23
    iput v0, p0, Lcom/zte/mifavor/androidx/preference/ListPreferenceZTEX;->o0:I

    .line 24
    .line 25
    const/4 v0, 0x1

    .line 26
    iput-boolean v0, p0, Lcom/zte/mifavor/androidx/preference/ListPreferenceZTEX;->p0:Z

    .line 27
    .line 28
    const-string v1, ""

    .line 29
    .line 30
    iput-object v1, p0, Lcom/zte/mifavor/androidx/preference/ListPreferenceZTEX;->q0:Ljava/lang/String;

    .line 31
    .line 32
    iput-boolean v0, p0, Lcom/zte/mifavor/androidx/preference/ListPreferenceZTEX;->r0:Z

    .line 33
    .line 34
    const/4 v0, 0x0

    .line 35
    iput-object v0, p0, Lcom/zte/mifavor/androidx/preference/ListPreferenceZTEX;->s0:Landroid/graphics/drawable/Drawable;

    .line 36
    .line 37
    const/4 v0, -0x2

    .line 38
    iput v0, p0, Lcom/zte/mifavor/androidx/preference/ListPreferenceZTEX;->t0:I

    .line 39
    .line 40
    invoke-direct {p0, p1, p2}, Lcom/zte/mifavor/androidx/preference/ListPreferenceZTEX;->k1(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 41
    .line 42
    .line 43
    iput-object p1, p0, Lcom/zte/mifavor/androidx/preference/ListPreferenceZTEX;->j0:Landroid/content/Context;

    .line 44
    .line 45
    return-void
.end method

.method public static i1()Z
    .locals 4

    .line 1
    const-string v0, "ListPreferenceZTEx"

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    :try_start_0
    const-string v2, "ro.vendor.feature.summary_default_botttom"

    .line 5
    .line 6
    invoke-static {v2, v1}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    new-instance v2, Ljava/lang/StringBuilder;

    .line 11
    .line 12
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 13
    .line 14
    .line 15
    const-string v3, "get Properties Is Summary Right out. getBoolean summary_default_botttom, isBottom="

    .line 16
    .line 17
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    invoke-static {v0, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 28
    .line 29
    .line 30
    xor-int/lit8 v0, v1, 0x1

    .line 31
    .line 32
    return v0

    .line 33
    :catch_0
    move-exception v2

    .line 34
    const-string v3, "get Properties Is Summary Right error, e"

    .line 35
    .line 36
    invoke-static {v0, v3, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 37
    .line 38
    .line 39
    new-instance v2, Ljava/lang/StringBuilder;

    .line 40
    .line 41
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 42
    .line 43
    .line 44
    const-string v3, "get Properties Is Summary Right out. isBottom = "

    .line 45
    .line 46
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    invoke-static {v0, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 57
    .line 58
    .line 59
    xor-int/lit8 v0, v1, 0x1

    .line 60
    .line 61
    return v0
.end method

.method private k1(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "RestrictedApi"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/zte/mifavor/androidx/preference/ListPreferenceZTEX;->j0:Landroid/content/Context;

    .line 2
    .line 3
    sget-object v0, LR3/m;->K2:[I

    .line 4
    .line 5
    invoke-virtual {p1, p2, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    sget p2, LR3/m;->U2:I

    .line 10
    .line 11
    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    iput-object p2, p0, Lcom/zte/mifavor/androidx/preference/ListPreferenceZTEX;->i0:Ljava/lang/CharSequence;

    .line 16
    .line 17
    sget p2, LR3/m;->R2:I

    .line 18
    .line 19
    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p2

    .line 23
    iput-object p2, p0, Lcom/zte/mifavor/androidx/preference/ListPreferenceZTEX;->q0:Ljava/lang/String;

    .line 24
    .line 25
    sget p2, LR3/m;->O2:I

    .line 26
    .line 27
    const/4 v0, 0x1

    .line 28
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 29
    .line 30
    .line 31
    move-result p2

    .line 32
    iput-boolean p2, p0, Lcom/zte/mifavor/androidx/preference/ListPreferenceZTEX;->r0:Z

    .line 33
    .line 34
    sget p2, LR3/m;->Q2:I

    .line 35
    .line 36
    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 37
    .line 38
    .line 39
    move-result-object p2

    .line 40
    iput-object p2, p0, Lcom/zte/mifavor/androidx/preference/ListPreferenceZTEX;->s0:Landroid/graphics/drawable/Drawable;

    .line 41
    .line 42
    sget p2, LR3/m;->S2:I

    .line 43
    .line 44
    const/4 v0, -0x2

    .line 45
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 46
    .line 47
    .line 48
    move-result p2

    .line 49
    iput p2, p0, Lcom/zte/mifavor/androidx/preference/ListPreferenceZTEX;->t0:I

    .line 50
    .line 51
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 52
    .line 53
    .line 54
    new-instance p1, Ljava/lang/StringBuilder;

    .line 55
    .line 56
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 57
    .line 58
    .line 59
    const-string p2, "init Prefrence Status XPG#, key="

    .line 60
    .line 61
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    invoke-virtual {p0}, Landroidx/preference/Preference;->t()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object p2

    .line 68
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    const-string p2, ", mStatus="

    .line 72
    .line 73
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    iget-object p2, p0, Lcom/zte/mifavor/androidx/preference/ListPreferenceZTEX;->i0:Ljava/lang/CharSequence;

    .line 77
    .line 78
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 79
    .line 80
    .line 81
    const-string p2, ", mMyTag="

    .line 82
    .line 83
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    iget-object p2, p0, Lcom/zte/mifavor/androidx/preference/ListPreferenceZTEX;->q0:Ljava/lang/String;

    .line 87
    .line 88
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    const-string p2, ", mIsCard="

    .line 92
    .line 93
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    iget-boolean p2, p0, Lcom/zte/mifavor/androidx/preference/ListPreferenceZTEX;->r0:Z

    .line 97
    .line 98
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 99
    .line 100
    .line 101
    const-string p2, ", mNumber="

    .line 102
    .line 103
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 104
    .line 105
    .line 106
    iget p0, p0, Lcom/zte/mifavor/androidx/preference/ListPreferenceZTEX;->t0:I

    .line 107
    .line 108
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 109
    .line 110
    .line 111
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object p0

    .line 115
    const-string p1, "ListPreferenceZTEx"

    .line 116
    .line 117
    invoke-static {p1, p0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 118
    .line 119
    .line 120
    return-void
.end method

.method private static l1(Landroid/content/Context;Landroid/util/AttributeSet;)Z
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "Is Summary Right in. mIsSummaryRight="

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    sget-boolean v1, Lcom/zte/mifavor/androidx/preference/ListPreferenceZTEX;->u0:Z

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const-string v1, "ListPreferenceZTEx"

    .line 21
    .line 22
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 23
    .line 24
    .line 25
    sget-object v0, LR3/m;->K2:[I

    .line 26
    .line 27
    const/4 v2, 0x0

    .line 28
    invoke-virtual {p0, p1, v0, v2, v2}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    sget p1, LR3/m;->P2:I

    .line 33
    .line 34
    invoke-static {}, Lcom/zte/mifavor/androidx/preference/ListPreferenceZTEX;->i1()Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    invoke-virtual {p0, p1, v0}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    sput-boolean p1, Lcom/zte/mifavor/androidx/preference/ListPreferenceZTEX;->u0:Z

    .line 43
    .line 44
    invoke-virtual {p0}, Landroid/content/res/TypedArray;->recycle()V

    .line 45
    .line 46
    .line 47
    new-instance p0, Ljava/lang/StringBuilder;

    .line 48
    .line 49
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 50
    .line 51
    .line 52
    const-string p1, "Is Summary Right out. mIsSummaryRight="

    .line 53
    .line 54
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    sget-boolean p1, Lcom/zte/mifavor/androidx/preference/ListPreferenceZTEX;->u0:Z

    .line 58
    .line 59
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 67
    .line 68
    .line 69
    sget-boolean p0, Lcom/zte/mifavor/androidx/preference/ListPreferenceZTEX;->u0:Z

    .line 70
    .line 71
    return p0
.end method


# virtual methods
.method public J0(Ljava/lang/CharSequence;)V
    .locals 2

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/zte/mifavor/androidx/preference/ListPreferenceZTEX;->k0:Landroid/widget/TextView;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 13
    .line 14
    .line 15
    :cond_0
    invoke-super {p0, p1}, Landroidx/preference/ListPreference;->J0(Ljava/lang/CharSequence;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public W(Landroidx/preference/h;)V
    .locals 3

    .line 1
    invoke-super {p0, p1}, Landroidx/preference/Preference;->W(Landroidx/preference/h;)V

    .line 2
    .line 3
    .line 4
    const v0, 0x1020010

    .line 5
    .line 6
    .line 7
    invoke-virtual {p1, v0}, Landroidx/preference/h;->a(I)Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Landroid/widget/TextView;

    .line 12
    .line 13
    iput-object v0, p0, Lcom/zte/mifavor/androidx/preference/ListPreferenceZTEX;->k0:Landroid/widget/TextView;

    .line 14
    .line 15
    iget v0, p0, Lcom/zte/mifavor/androidx/preference/ListPreferenceZTEX;->n0:I

    .line 16
    .line 17
    const/4 v1, -0x1

    .line 18
    if-eq v1, v0, :cond_0

    .line 19
    .line 20
    invoke-virtual {p0, v0}, Lcom/zte/mifavor/androidx/preference/ListPreferenceZTEX;->o1(I)V

    .line 21
    .line 22
    .line 23
    :cond_0
    iget v0, p0, Lcom/zte/mifavor/androidx/preference/ListPreferenceZTEX;->n0:I

    .line 24
    .line 25
    if-eq v1, v0, :cond_1

    .line 26
    .line 27
    iget v2, p0, Lcom/zte/mifavor/androidx/preference/ListPreferenceZTEX;->o0:I

    .line 28
    .line 29
    if-eq v1, v2, :cond_1

    .line 30
    .line 31
    invoke-virtual {p0, v0, v2}, Lcom/zte/mifavor/androidx/preference/ListPreferenceZTEX;->n1(II)V

    .line 32
    .line 33
    .line 34
    :cond_1
    sget-boolean v0, Lcom/zte/mifavor/androidx/preference/ListPreferenceZTEX;->u0:Z

    .line 35
    .line 36
    const-string v2, "ListPreferenceZTEx"

    .line 37
    .line 38
    if-eqz v0, :cond_2

    .line 39
    .line 40
    sget v0, LR3/g;->p0:I

    .line 41
    .line 42
    invoke-virtual {p1, v0}, Landroidx/preference/h;->a(I)Landroid/view/View;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    check-cast p1, Landroid/widget/TextView;

    .line 47
    .line 48
    iput-object p1, p0, Lcom/zte/mifavor/androidx/preference/ListPreferenceZTEX;->l0:Landroid/widget/TextView;

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_2
    const v0, 0x1020018

    .line 52
    .line 53
    .line 54
    invoke-virtual {p1, v0}, Landroidx/preference/h;->a(I)Landroid/view/View;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    check-cast p1, Landroid/widget/LinearLayout;

    .line 59
    .line 60
    if-eqz p1, :cond_3

    .line 61
    .line 62
    sget v0, LR3/g;->p0:I

    .line 63
    .line 64
    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    check-cast p1, Landroid/widget/TextView;

    .line 69
    .line 70
    iput-object p1, p0, Lcom/zte/mifavor/androidx/preference/ListPreferenceZTEX;->l0:Landroid/widget/TextView;

    .line 71
    .line 72
    goto :goto_0

    .line 73
    :cond_3
    const-string p1, "onBindViewHolder widgetView is null."

    .line 74
    .line 75
    invoke-static {v2, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 76
    .line 77
    .line 78
    :goto_0
    iget-object p1, p0, Lcom/zte/mifavor/androidx/preference/ListPreferenceZTEX;->l0:Landroid/widget/TextView;

    .line 79
    .line 80
    if-eqz p1, :cond_6

    .line 81
    .line 82
    invoke-virtual {p0}, Lcom/zte/mifavor/androidx/preference/ListPreferenceZTEX;->j1()Ljava/lang/CharSequence;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 87
    .line 88
    .line 89
    move-result v0

    .line 90
    if-nez v0, :cond_5

    .line 91
    .line 92
    iget-object v0, p0, Lcom/zte/mifavor/androidx/preference/ListPreferenceZTEX;->l0:Landroid/widget/TextView;

    .line 93
    .line 94
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 95
    .line 96
    .line 97
    iget-object p1, p0, Lcom/zte/mifavor/androidx/preference/ListPreferenceZTEX;->l0:Landroid/widget/TextView;

    .line 98
    .line 99
    const/4 v0, 0x0

    .line 100
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setVisibility(I)V

    .line 101
    .line 102
    .line 103
    iget-object p1, p0, Lcom/zte/mifavor/androidx/preference/ListPreferenceZTEX;->l0:Landroid/widget/TextView;

    .line 104
    .line 105
    iget-boolean v0, p0, Lcom/zte/mifavor/androidx/preference/ListPreferenceZTEX;->p0:Z

    .line 106
    .line 107
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setEnabled(Z)V

    .line 108
    .line 109
    .line 110
    iget p1, p0, Lcom/zte/mifavor/androidx/preference/ListPreferenceZTEX;->m0:I

    .line 111
    .line 112
    if-eq v1, p1, :cond_4

    .line 113
    .line 114
    invoke-virtual {p0, p1}, Lcom/zte/mifavor/androidx/preference/ListPreferenceZTEX;->m1(I)V

    .line 115
    .line 116
    .line 117
    :cond_4
    return-void

    .line 118
    :cond_5
    iget-object p0, p0, Lcom/zte/mifavor/androidx/preference/ListPreferenceZTEX;->l0:Landroid/widget/TextView;

    .line 119
    .line 120
    const/16 p1, 0x8

    .line 121
    .line 122
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 123
    .line 124
    .line 125
    return-void

    .line 126
    :cond_6
    new-instance p1, Ljava/lang/StringBuilder;

    .line 127
    .line 128
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 129
    .line 130
    .line 131
    const-string v0, "onBindViewHolder mStatusView = "

    .line 132
    .line 133
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 134
    .line 135
    .line 136
    iget-object p0, p0, Lcom/zte/mifavor/androidx/preference/ListPreferenceZTEX;->l0:Landroid/widget/TextView;

    .line 137
    .line 138
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 139
    .line 140
    .line 141
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 142
    .line 143
    .line 144
    move-result-object p0

    .line 145
    invoke-static {v2, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 146
    .line 147
    .line 148
    return-void
.end method

.method public getNumber()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/zte/mifavor/androidx/preference/ListPreferenceZTEX;->t0:I

    .line 2
    .line 3
    return p0
.end method

.method public h1()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/zte/mifavor/androidx/preference/ListPreferenceZTEX;->r0:Z

    .line 2
    .line 3
    return p0
.end method

.method public j1()Ljava/lang/CharSequence;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/mifavor/androidx/preference/ListPreferenceZTEX;->i0:Ljava/lang/CharSequence;

    .line 2
    .line 3
    return-object p0
.end method

.method public m1(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/zte/mifavor/androidx/preference/ListPreferenceZTEX;->l0:Landroid/widget/TextView;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/widget/TextView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput p1, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 10
    .line 11
    iget-object p0, p0, Lcom/zte/mifavor/androidx/preference/ListPreferenceZTEX;->l0:Landroid/widget/TextView;

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    iput p1, p0, Lcom/zte/mifavor/androidx/preference/ListPreferenceZTEX;->m0:I

    .line 18
    .line 19
    return-void
.end method

.method public n1(II)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/zte/mifavor/androidx/preference/ListPreferenceZTEX;->k0:Landroid/widget/TextView;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/widget/TextView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput p1, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 10
    .line 11
    iput p2, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 12
    .line 13
    iget-object p0, p0, Lcom/zte/mifavor/androidx/preference/ListPreferenceZTEX;->k0:Landroid/widget/TextView;

    .line 14
    .line 15
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    iput p1, p0, Lcom/zte/mifavor/androidx/preference/ListPreferenceZTEX;->n0:I

    .line 20
    .line 21
    iput p2, p0, Lcom/zte/mifavor/androidx/preference/ListPreferenceZTEX;->o0:I

    .line 22
    .line 23
    return-void
.end method

.method public o1(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/zte/mifavor/androidx/preference/ListPreferenceZTEX;->k0:Landroid/widget/TextView;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/widget/TextView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput p1, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 10
    .line 11
    iget-object p0, p0, Lcom/zte/mifavor/androidx/preference/ListPreferenceZTEX;->k0:Landroid/widget/TextView;

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    iput p1, p0, Lcom/zte/mifavor/androidx/preference/ListPreferenceZTEX;->n0:I

    .line 18
    .line 19
    return-void
.end method
