.class public Lcom/zte/mifavor/widget/ProgressDialog;
.super Lcom/zte/mifavor/widget/d;
.source "ProgressDialog.java"


# static fields
.field public static final STYLE_HORIZONTAL:I = 0x1

.field public static final STYLE_SPINNER:I = 0x0

.field private static final TAG:Ljava/lang/String; = "Z#DialogProgress"


# instance fields
.field private isSetProgressNumberFormat:Z

.field private mColorProgress:Lcom/zte/mifavor/widget/ColorProgressBarZTE;

.field private mHasStarted:Z

.field private mIncrementBy:I

.field private mIncrementSecondaryBy:I

.field private mIndeterminate:Z

.field private mIndeterminateDrawable:Landroid/graphics/drawable/Drawable;

.field private mIsColorProgress:Z

.field private mMax:I

.field private mMessage:Ljava/lang/CharSequence;

.field private mMessageView:Landroid/widget/TextView;

.field private mProgress:Landroid/widget/ProgressBar;

.field private mProgressDrawable:Landroid/graphics/drawable/Drawable;

.field private mProgressNumber:Landroid/widget/TextView;

.field private mProgressNumberFormat:Ljava/lang/String;

.field private mProgressPercent:Landroid/widget/TextView;

.field private mProgressPercentFormat:Ljava/text/NumberFormat;

.field private mProgressStyle:I

.field private mProgressVal:I

.field private mSecondaryProgressVal:I

.field private mViewUpdateHandler:Landroid/os/Handler;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/zte/mifavor/widget/d;-><init>(Landroid/content/Context;)V

    const/4 p1, 0x0

    .line 2
    iput-boolean p1, p0, Lcom/zte/mifavor/widget/ProgressDialog;->mIsColorProgress:Z

    .line 3
    iput p1, p0, Lcom/zte/mifavor/widget/ProgressDialog;->mProgressStyle:I

    .line 4
    invoke-direct {p0}, Lcom/zte/mifavor/widget/ProgressDialog;->initFormats()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;I)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Lcom/zte/mifavor/widget/d;-><init>(Landroid/content/Context;I)V

    const/4 p1, 0x0

    .line 6
    iput-boolean p1, p0, Lcom/zte/mifavor/widget/ProgressDialog;->mIsColorProgress:Z

    .line 7
    iput p1, p0, Lcom/zte/mifavor/widget/ProgressDialog;->mProgressStyle:I

    .line 8
    invoke-direct {p0}, Lcom/zte/mifavor/widget/ProgressDialog;->initFormats()V

    return-void
.end method

.method static bridge synthetic b(Lcom/zte/mifavor/widget/ProgressDialog;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/zte/mifavor/widget/ProgressDialog;->isSetProgressNumberFormat:Z

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic c(Lcom/zte/mifavor/widget/ProgressDialog;)Lcom/zte/mifavor/widget/ColorProgressBarZTE;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/mifavor/widget/ProgressDialog;->mColorProgress:Lcom/zte/mifavor/widget/ColorProgressBarZTE;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic d(Lcom/zte/mifavor/widget/ProgressDialog;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/zte/mifavor/widget/ProgressDialog;->mIsColorProgress:Z

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic e(Lcom/zte/mifavor/widget/ProgressDialog;)Landroid/widget/ProgressBar;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/mifavor/widget/ProgressDialog;->mProgress:Landroid/widget/ProgressBar;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic f(Lcom/zte/mifavor/widget/ProgressDialog;)Landroid/widget/TextView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/mifavor/widget/ProgressDialog;->mProgressNumber:Landroid/widget/TextView;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic g(Lcom/zte/mifavor/widget/ProgressDialog;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/mifavor/widget/ProgressDialog;->mProgressNumberFormat:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic h(Lcom/zte/mifavor/widget/ProgressDialog;)Landroid/widget/TextView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/mifavor/widget/ProgressDialog;->mProgressPercent:Landroid/widget/TextView;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic i(Lcom/zte/mifavor/widget/ProgressDialog;)Ljava/text/NumberFormat;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/mifavor/widget/ProgressDialog;->mProgressPercentFormat:Ljava/text/NumberFormat;

    .line 2
    .line 3
    return-object p0
.end method

.method private initFormats()V
    .locals 3

    .line 1
    const-string v0, "init Formats in."

    .line 2
    .line 3
    const-string v1, "Z#DialogProgress"

    .line 4
    .line 5
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    const-string v0, "%1d/%2d"

    .line 9
    .line 10
    iput-object v0, p0, Lcom/zte/mifavor/widget/ProgressDialog;->mProgressNumberFormat:Ljava/lang/String;

    .line 11
    .line 12
    invoke-static {}, Ljava/text/NumberFormat;->getPercentInstance()Ljava/text/NumberFormat;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iput-object v0, p0, Lcom/zte/mifavor/widget/ProgressDialog;->mProgressPercentFormat:Ljava/text/NumberFormat;

    .line 17
    .line 18
    const/4 v2, 0x0

    .line 19
    invoke-virtual {v0, v2}, Ljava/text/NumberFormat;->setMaximumFractionDigits(I)V

    .line 20
    .line 21
    .line 22
    iput-boolean v2, p0, Lcom/zte/mifavor/widget/ProgressDialog;->isSetProgressNumberFormat:Z

    .line 23
    .line 24
    const-string p0, "init Formats out."

    .line 25
    .line 26
    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method private onProgressChanged()V
    .locals 2

    .line 1
    iget v0, p0, Lcom/zte/mifavor/widget/ProgressDialog;->mProgressStyle:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    iget-object v0, p0, Lcom/zte/mifavor/widget/ProgressDialog;->mViewUpdateHandler:Landroid/os/Handler;

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-virtual {v0, v1}, Landroid/os/Handler;->hasMessages(I)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    iget-object p0, p0, Lcom/zte/mifavor/widget/ProgressDialog;->mViewUpdateHandler:Landroid/os/Handler;

    .line 18
    .line 19
    invoke-virtual {p0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method private setMeassageGravity()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const v0, 0x102000b

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v0}, Landroid/view/Window;->findViewById(I)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Landroid/widget/TextView;

    .line 13
    .line 14
    if-eqz p0, :cond_0

    .line 15
    .line 16
    instance-of v0, p0, Lcom/zte/mifavor/widget/DialogMessage;

    .line 17
    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    check-cast p0, Lcom/zte/mifavor/widget/DialogMessage;

    .line 21
    .line 22
    const/4 v0, 0x1

    .line 23
    invoke-virtual {p0, v0}, Lcom/zte/mifavor/widget/DialogMessage;->setIsMultiplelines(Z)V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method public static show(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Lcom/zte/mifavor/widget/ProgressDialog;
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-static {p0, p1, p2, v0}, Lcom/zte/mifavor/widget/ProgressDialog;->show(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Z)Lcom/zte/mifavor/widget/ProgressDialog;

    move-result-object p0

    return-object p0
.end method

.method public static show(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Z)Lcom/zte/mifavor/widget/ProgressDialog;
    .locals 6

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    .line 2
    invoke-static/range {v0 .. v5}, Lcom/zte/mifavor/widget/ProgressDialog;->show(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;ZZLandroid/content/DialogInterface$OnCancelListener;)Lcom/zte/mifavor/widget/ProgressDialog;

    move-result-object p0

    return-object p0
.end method

.method public static show(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;ZZ)Lcom/zte/mifavor/widget/ProgressDialog;
    .locals 6

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move v4, p4

    .line 3
    invoke-static/range {v0 .. v5}, Lcom/zte/mifavor/widget/ProgressDialog;->show(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;ZZLandroid/content/DialogInterface$OnCancelListener;)Lcom/zte/mifavor/widget/ProgressDialog;

    move-result-object p0

    return-object p0
.end method

.method public static show(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;ZZLandroid/content/DialogInterface$OnCancelListener;)Lcom/zte/mifavor/widget/ProgressDialog;
    .locals 2

    .line 4
    const-string v0, "Z#DialogProgress"

    const-string v1, "Progress Dialog show. "

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 5
    new-instance v0, Lcom/zte/mifavor/widget/ProgressDialog;

    invoke-direct {v0, p0}, Lcom/zte/mifavor/widget/ProgressDialog;-><init>(Landroid/content/Context;)V

    .line 6
    invoke-virtual {v0, p1}, Lcom/zte/mifavor/widget/d;->setTitle(Ljava/lang/CharSequence;)V

    .line 7
    invoke-virtual {v0, p2}, Lcom/zte/mifavor/widget/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 8
    invoke-virtual {v0, p3}, Lcom/zte/mifavor/widget/ProgressDialog;->setIndeterminate(Z)V

    .line 9
    invoke-virtual {v0, p4}, Landroid/app/Dialog;->setCancelable(Z)V

    .line 10
    invoke-virtual {v0, p5}, Landroid/app/Dialog;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)V

    .line 11
    invoke-virtual {v0}, Lcom/zte/mifavor/widget/d;->closeSyncGravity()V

    .line 12
    invoke-virtual {v0}, Lcom/zte/mifavor/widget/ProgressDialog;->show()V

    return-object v0
.end method


# virtual methods
.method public getMax()I
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/zte/mifavor/widget/ProgressDialog;->mIsColorProgress:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/zte/mifavor/widget/ProgressDialog;->mColorProgress:Lcom/zte/mifavor/widget/ColorProgressBarZTE;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->getMax()F

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    invoke-static {p0}, Ljava/lang/Math;->round(F)I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    return p0

    .line 20
    :cond_0
    iget-object v0, p0, Lcom/zte/mifavor/widget/ProgressDialog;->mProgress:Landroid/widget/ProgressBar;

    .line 21
    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    invoke-virtual {v0}, Landroid/widget/ProgressBar;->getMax()I

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    return p0

    .line 29
    :cond_1
    iget p0, p0, Lcom/zte/mifavor/widget/ProgressDialog;->mMax:I

    .line 30
    .line 31
    return p0
.end method

.method public getProgress()I
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/zte/mifavor/widget/ProgressDialog;->mIsColorProgress:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/zte/mifavor/widget/ProgressDialog;->mColorProgress:Lcom/zte/mifavor/widget/ColorProgressBarZTE;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->getProgress()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0

    .line 14
    :cond_0
    iget-object v0, p0, Lcom/zte/mifavor/widget/ProgressDialog;->mProgress:Landroid/widget/ProgressBar;

    .line 15
    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    invoke-virtual {v0}, Landroid/widget/ProgressBar;->getProgress()I

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    return p0

    .line 23
    :cond_1
    iget p0, p0, Lcom/zte/mifavor/widget/ProgressDialog;->mProgressVal:I

    .line 24
    .line 25
    return p0
.end method

.method public getSecondaryProgress()I
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/zte/mifavor/widget/ProgressDialog;->mProgress:Landroid/widget/ProgressBar;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/widget/ProgressBar;->getSecondaryProgress()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    iget p0, p0, Lcom/zte/mifavor/widget/ProgressDialog;->mSecondaryProgressVal:I

    .line 11
    .line 12
    return p0
.end method

.method public incrementProgressBy(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/zte/mifavor/widget/ProgressDialog;->mProgress:Landroid/widget/ProgressBar;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Landroid/widget/ProgressBar;->incrementProgressBy(I)V

    .line 6
    .line 7
    .line 8
    invoke-direct {p0}, Lcom/zte/mifavor/widget/ProgressDialog;->onProgressChanged()V

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    iget v0, p0, Lcom/zte/mifavor/widget/ProgressDialog;->mIncrementBy:I

    .line 13
    .line 14
    add-int/2addr v0, p1

    .line 15
    iput v0, p0, Lcom/zte/mifavor/widget/ProgressDialog;->mIncrementBy:I

    .line 16
    .line 17
    return-void
.end method

.method public incrementSecondaryProgressBy(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/zte/mifavor/widget/ProgressDialog;->mProgress:Landroid/widget/ProgressBar;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Landroid/widget/ProgressBar;->incrementSecondaryProgressBy(I)V

    .line 6
    .line 7
    .line 8
    invoke-direct {p0}, Lcom/zte/mifavor/widget/ProgressDialog;->onProgressChanged()V

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    iget v0, p0, Lcom/zte/mifavor/widget/ProgressDialog;->mIncrementSecondaryBy:I

    .line 13
    .line 14
    add-int/2addr v0, p1

    .line 15
    iput v0, p0, Lcom/zte/mifavor/widget/ProgressDialog;->mIncrementSecondaryBy:I

    .line 16
    .line 17
    return-void
.end method

.method public isIndeterminate()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/zte/mifavor/widget/ProgressDialog;->mProgress:Landroid/widget/ProgressBar;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/widget/ProgressBar;->isIndeterminate()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    iget-boolean p0, p0, Lcom/zte/mifavor/widget/ProgressDialog;->mIndeterminate:Z

    .line 11
    .line 12
    return p0
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 8

    .line 1
    const-string v0, "onCreate in."

    .line 2
    .line 3
    const-string v1, "Z#DialogProgress"

    .line 4
    .line 5
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {p0}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    sget-object v3, LR3/m;->h:[I

    .line 21
    .line 22
    sget v4, LR3/c;->b:I

    .line 23
    .line 24
    const/4 v5, 0x0

    .line 25
    const/4 v6, 0x0

    .line 26
    invoke-virtual {v2, v5, v3, v4, v6}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    iget v3, p0, Lcom/zte/mifavor/widget/ProgressDialog;->mProgressStyle:I

    .line 31
    .line 32
    const/4 v4, 0x1

    .line 33
    if-ne v3, v4, :cond_1

    .line 34
    .line 35
    new-instance v3, Lcom/zte/mifavor/widget/ProgressDialog$a;

    .line 36
    .line 37
    invoke-direct {v3, p0}, Lcom/zte/mifavor/widget/ProgressDialog$a;-><init>(Lcom/zte/mifavor/widget/ProgressDialog;)V

    .line 38
    .line 39
    .line 40
    iput-object v3, p0, Lcom/zte/mifavor/widget/ProgressDialog;->mViewUpdateHandler:Landroid/os/Handler;

    .line 41
    .line 42
    sget v3, LR3/m;->q:I

    .line 43
    .line 44
    sget v7, LR3/i;->d:I

    .line 45
    .line 46
    invoke-virtual {v2, v3, v7}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 47
    .line 48
    .line 49
    move-result v3

    .line 50
    invoke-virtual {v0, v3, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    const v3, 0x102000d

    .line 55
    .line 56
    .line 57
    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 58
    .line 59
    .line 60
    move-result-object v3

    .line 61
    if-eqz v3, :cond_0

    .line 62
    .line 63
    instance-of v5, v3, Lcom/zte/mifavor/widget/ColorProgressBarZTE;

    .line 64
    .line 65
    if-eqz v5, :cond_0

    .line 66
    .line 67
    check-cast v3, Lcom/zte/mifavor/widget/ColorProgressBarZTE;

    .line 68
    .line 69
    iput-object v3, p0, Lcom/zte/mifavor/widget/ProgressDialog;->mColorProgress:Lcom/zte/mifavor/widget/ColorProgressBarZTE;

    .line 70
    .line 71
    iput-boolean v4, p0, Lcom/zte/mifavor/widget/ProgressDialog;->mIsColorProgress:Z

    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_0
    check-cast v3, Landroid/widget/ProgressBar;

    .line 75
    .line 76
    iput-object v3, p0, Lcom/zte/mifavor/widget/ProgressDialog;->mProgress:Landroid/widget/ProgressBar;

    .line 77
    .line 78
    iput-boolean v6, p0, Lcom/zte/mifavor/widget/ProgressDialog;->mIsColorProgress:Z

    .line 79
    .line 80
    :goto_0
    sget v3, LR3/g;->e0:I

    .line 81
    .line 82
    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 83
    .line 84
    .line 85
    move-result-object v3

    .line 86
    check-cast v3, Landroid/widget/TextView;

    .line 87
    .line 88
    iput-object v3, p0, Lcom/zte/mifavor/widget/ProgressDialog;->mProgressNumber:Landroid/widget/TextView;

    .line 89
    .line 90
    sget v3, LR3/g;->f0:I

    .line 91
    .line 92
    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 93
    .line 94
    .line 95
    move-result-object v3

    .line 96
    check-cast v3, Landroid/widget/TextView;

    .line 97
    .line 98
    iput-object v3, p0, Lcom/zte/mifavor/widget/ProgressDialog;->mProgressPercent:Landroid/widget/TextView;

    .line 99
    .line 100
    invoke-virtual {p0, v0}, Lcom/zte/mifavor/widget/d;->setView(Landroid/view/View;)V

    .line 101
    .line 102
    .line 103
    goto :goto_1

    .line 104
    :cond_1
    sget v3, LR3/m;->w:I

    .line 105
    .line 106
    sget v4, LR3/i;->j:I

    .line 107
    .line 108
    invoke-virtual {v2, v3, v4}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 109
    .line 110
    .line 111
    move-result v3

    .line 112
    invoke-virtual {v0, v3, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    sget v3, LR3/g;->d0:I

    .line 117
    .line 118
    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 119
    .line 120
    .line 121
    move-result-object v3

    .line 122
    check-cast v3, Landroid/widget/ProgressBar;

    .line 123
    .line 124
    iput-object v3, p0, Lcom/zte/mifavor/widget/ProgressDialog;->mProgress:Landroid/widget/ProgressBar;

    .line 125
    .line 126
    sget v3, LR3/g;->M:I

    .line 127
    .line 128
    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 129
    .line 130
    .line 131
    move-result-object v3

    .line 132
    check-cast v3, Landroid/widget/TextView;

    .line 133
    .line 134
    iput-object v3, p0, Lcom/zte/mifavor/widget/ProgressDialog;->mMessageView:Landroid/widget/TextView;

    .line 135
    .line 136
    invoke-virtual {p0, v0}, Lcom/zte/mifavor/widget/d;->setView(Landroid/view/View;)V

    .line 137
    .line 138
    .line 139
    :goto_1
    invoke-virtual {v2}, Landroid/content/res/TypedArray;->recycle()V

    .line 140
    .line 141
    .line 142
    iget v0, p0, Lcom/zte/mifavor/widget/ProgressDialog;->mMax:I

    .line 143
    .line 144
    if-lez v0, :cond_2

    .line 145
    .line 146
    invoke-virtual {p0, v0}, Lcom/zte/mifavor/widget/ProgressDialog;->setMax(I)V

    .line 147
    .line 148
    .line 149
    :cond_2
    iget v0, p0, Lcom/zte/mifavor/widget/ProgressDialog;->mProgressVal:I

    .line 150
    .line 151
    if-lez v0, :cond_3

    .line 152
    .line 153
    invoke-virtual {p0, v0}, Lcom/zte/mifavor/widget/ProgressDialog;->setProgress(I)V

    .line 154
    .line 155
    .line 156
    :cond_3
    iget v0, p0, Lcom/zte/mifavor/widget/ProgressDialog;->mSecondaryProgressVal:I

    .line 157
    .line 158
    if-lez v0, :cond_4

    .line 159
    .line 160
    invoke-virtual {p0, v0}, Lcom/zte/mifavor/widget/ProgressDialog;->setSecondaryProgress(I)V

    .line 161
    .line 162
    .line 163
    :cond_4
    iget v0, p0, Lcom/zte/mifavor/widget/ProgressDialog;->mIncrementBy:I

    .line 164
    .line 165
    if-lez v0, :cond_5

    .line 166
    .line 167
    invoke-virtual {p0, v0}, Lcom/zte/mifavor/widget/ProgressDialog;->incrementProgressBy(I)V

    .line 168
    .line 169
    .line 170
    :cond_5
    iget v0, p0, Lcom/zte/mifavor/widget/ProgressDialog;->mIncrementSecondaryBy:I

    .line 171
    .line 172
    if-lez v0, :cond_6

    .line 173
    .line 174
    invoke-virtual {p0, v0}, Lcom/zte/mifavor/widget/ProgressDialog;->incrementSecondaryProgressBy(I)V

    .line 175
    .line 176
    .line 177
    :cond_6
    iget-object v0, p0, Lcom/zte/mifavor/widget/ProgressDialog;->mProgressDrawable:Landroid/graphics/drawable/Drawable;

    .line 178
    .line 179
    if-eqz v0, :cond_7

    .line 180
    .line 181
    invoke-virtual {p0, v0}, Lcom/zte/mifavor/widget/ProgressDialog;->setProgressDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 182
    .line 183
    .line 184
    :cond_7
    iget-object v0, p0, Lcom/zte/mifavor/widget/ProgressDialog;->mIndeterminateDrawable:Landroid/graphics/drawable/Drawable;

    .line 185
    .line 186
    if-eqz v0, :cond_8

    .line 187
    .line 188
    invoke-virtual {p0, v0}, Lcom/zte/mifavor/widget/ProgressDialog;->setIndeterminateDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 189
    .line 190
    .line 191
    :cond_8
    iget-object v0, p0, Lcom/zte/mifavor/widget/ProgressDialog;->mMessage:Ljava/lang/CharSequence;

    .line 192
    .line 193
    if-eqz v0, :cond_9

    .line 194
    .line 195
    invoke-virtual {p0, v0}, Lcom/zte/mifavor/widget/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 196
    .line 197
    .line 198
    :cond_9
    iget-boolean v0, p0, Lcom/zte/mifavor/widget/ProgressDialog;->mIndeterminate:Z

    .line 199
    .line 200
    invoke-virtual {p0, v0}, Lcom/zte/mifavor/widget/ProgressDialog;->setIndeterminate(Z)V

    .line 201
    .line 202
    .line 203
    invoke-direct {p0}, Lcom/zte/mifavor/widget/ProgressDialog;->onProgressChanged()V

    .line 204
    .line 205
    .line 206
    invoke-super {p0, p1}, Lcom/zte/mifavor/widget/d;->onCreate(Landroid/os/Bundle;)V

    .line 207
    .line 208
    .line 209
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 210
    .line 211
    .line 212
    move-result-object p0

    .line 213
    sget p1, LR3/g;->j0:I

    .line 214
    .line 215
    invoke-virtual {p0, p1}, Landroid/view/Window;->findViewById(I)Landroid/view/View;

    .line 216
    .line 217
    .line 218
    move-result-object p0

    .line 219
    check-cast p0, Landroid/widget/ScrollView;

    .line 220
    .line 221
    invoke-virtual {p0}, Landroid/widget/ScrollView;->getPaddingStart()I

    .line 222
    .line 223
    .line 224
    move-result p1

    .line 225
    invoke-virtual {p0}, Landroid/widget/ScrollView;->getPaddingEnd()I

    .line 226
    .line 227
    .line 228
    move-result v0

    .line 229
    invoke-virtual {p0, p1, v6, v0, v6}, Landroid/widget/ScrollView;->setPaddingRelative(IIII)V

    .line 230
    .line 231
    .line 232
    const-string p0, "onCreate out."

    .line 233
    .line 234
    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 235
    .line 236
    .line 237
    return-void
.end method

.method public onStart()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/app/Dialog;->onStart()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Lcom/zte/mifavor/widget/ProgressDialog;->mHasStarted:Z

    .line 6
    .line 7
    return-void
.end method

.method protected onStop()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/app/Dialog;->onStop()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/zte/mifavor/widget/ProgressDialog;->mHasStarted:Z

    .line 6
    .line 7
    return-void
.end method

.method public setIndeterminate(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/zte/mifavor/widget/ProgressDialog;->mProgress:Landroid/widget/ProgressBar;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Landroid/widget/ProgressBar;->setIndeterminate(Z)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    iput-boolean p1, p0, Lcom/zte/mifavor/widget/ProgressDialog;->mIndeterminate:Z

    .line 10
    .line 11
    return-void
.end method

.method public setIndeterminateDrawable(Landroid/graphics/drawable/Drawable;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/zte/mifavor/widget/ProgressDialog;->mProgress:Landroid/widget/ProgressBar;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Landroid/widget/ProgressBar;->setIndeterminateDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    iput-object p1, p0, Lcom/zte/mifavor/widget/ProgressDialog;->mIndeterminateDrawable:Landroid/graphics/drawable/Drawable;

    .line 10
    .line 11
    return-void
.end method

.method public setMax(I)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/zte/mifavor/widget/ProgressDialog;->mIsColorProgress:Z

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Lcom/zte/mifavor/widget/ProgressDialog;->mColorProgress:Lcom/zte/mifavor/widget/ColorProgressBarZTE;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    int-to-float p1, p1

    .line 10
    invoke-virtual {v0, p1}, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->setMax(F)V

    .line 11
    .line 12
    .line 13
    invoke-direct {p0}, Lcom/zte/mifavor/widget/ProgressDialog;->onProgressChanged()V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    iput p1, p0, Lcom/zte/mifavor/widget/ProgressDialog;->mMax:I

    .line 18
    .line 19
    return-void

    .line 20
    :cond_1
    iget-object v0, p0, Lcom/zte/mifavor/widget/ProgressDialog;->mProgress:Landroid/widget/ProgressBar;

    .line 21
    .line 22
    if-eqz v0, :cond_2

    .line 23
    .line 24
    invoke-virtual {v0, p1}, Landroid/widget/ProgressBar;->setMax(I)V

    .line 25
    .line 26
    .line 27
    invoke-direct {p0}, Lcom/zte/mifavor/widget/ProgressDialog;->onProgressChanged()V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_2
    iput p1, p0, Lcom/zte/mifavor/widget/ProgressDialog;->mMax:I

    .line 32
    .line 33
    return-void
.end method

.method public setMessage(Ljava/lang/CharSequence;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "set Message in. message="

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    const-string v1, ", mMessageView="

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    iget-object v1, p0, Lcom/zte/mifavor/widget/ProgressDialog;->mMessageView:Landroid/widget/TextView;

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    const-string v1, "Z#DialogProgress"

    .line 29
    .line 30
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Lcom/zte/mifavor/widget/ProgressDialog;->mProgress:Landroid/widget/ProgressBar;

    .line 34
    .line 35
    if-nez v0, :cond_1

    .line 36
    .line 37
    iget-boolean v0, p0, Lcom/zte/mifavor/widget/ProgressDialog;->mIsColorProgress:Z

    .line 38
    .line 39
    if-eqz v0, :cond_0

    .line 40
    .line 41
    iget-object v0, p0, Lcom/zte/mifavor/widget/ProgressDialog;->mColorProgress:Lcom/zte/mifavor/widget/ColorProgressBarZTE;

    .line 42
    .line 43
    if-eqz v0, :cond_0

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_0
    iput-object p1, p0, Lcom/zte/mifavor/widget/ProgressDialog;->mMessage:Ljava/lang/CharSequence;

    .line 47
    .line 48
    return-void

    .line 49
    :cond_1
    :goto_0
    iget v0, p0, Lcom/zte/mifavor/widget/ProgressDialog;->mProgressStyle:I

    .line 50
    .line 51
    const/4 v1, 0x1

    .line 52
    if-ne v0, v1, :cond_2

    .line 53
    .line 54
    invoke-super {p0, p1}, Lcom/zte/mifavor/widget/d;->setMessage(Ljava/lang/CharSequence;)V

    .line 55
    .line 56
    .line 57
    return-void

    .line 58
    :cond_2
    iget-object p0, p0, Lcom/zte/mifavor/widget/ProgressDialog;->mMessageView:Landroid/widget/TextView;

    .line 59
    .line 60
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 61
    .line 62
    .line 63
    return-void
.end method

.method public setProgress(I)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "set Progress in. value="

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const-string v1, "Z#DialogProgress"

    .line 19
    .line 20
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    iget-boolean v0, p0, Lcom/zte/mifavor/widget/ProgressDialog;->mHasStarted:Z

    .line 24
    .line 25
    if-eqz v0, :cond_2

    .line 26
    .line 27
    iget-boolean v0, p0, Lcom/zte/mifavor/widget/ProgressDialog;->mIsColorProgress:Z

    .line 28
    .line 29
    if-eqz v0, :cond_0

    .line 30
    .line 31
    iget-object v0, p0, Lcom/zte/mifavor/widget/ProgressDialog;->mColorProgress:Lcom/zte/mifavor/widget/ColorProgressBarZTE;

    .line 32
    .line 33
    if-eqz v0, :cond_0

    .line 34
    .line 35
    int-to-float p1, p1

    .line 36
    invoke-virtual {v0, p1}, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->setProgress(F)V

    .line 37
    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_0
    iget-object v0, p0, Lcom/zte/mifavor/widget/ProgressDialog;->mProgress:Landroid/widget/ProgressBar;

    .line 41
    .line 42
    if-eqz v0, :cond_1

    .line 43
    .line 44
    invoke-virtual {v0, p1}, Landroid/widget/ProgressBar;->setProgress(I)V

    .line 45
    .line 46
    .line 47
    :cond_1
    :goto_0
    invoke-direct {p0}, Lcom/zte/mifavor/widget/ProgressDialog;->onProgressChanged()V

    .line 48
    .line 49
    .line 50
    return-void

    .line 51
    :cond_2
    iput p1, p0, Lcom/zte/mifavor/widget/ProgressDialog;->mProgressVal:I

    .line 52
    .line 53
    return-void
.end method

.method public setProgressDrawable(Landroid/graphics/drawable/Drawable;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/zte/mifavor/widget/ProgressDialog;->mProgress:Landroid/widget/ProgressBar;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Landroid/widget/ProgressBar;->setProgressDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    iput-object p1, p0, Lcom/zte/mifavor/widget/ProgressDialog;->mProgressDrawable:Landroid/graphics/drawable/Drawable;

    .line 10
    .line 11
    return-void
.end method

.method public setProgressNumberFormat(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/zte/mifavor/widget/ProgressDialog;->mProgressNumberFormat:Ljava/lang/String;

    .line 2
    .line 3
    const/4 p1, 0x1

    .line 4
    iput-boolean p1, p0, Lcom/zte/mifavor/widget/ProgressDialog;->isSetProgressNumberFormat:Z

    .line 5
    .line 6
    invoke-direct {p0}, Lcom/zte/mifavor/widget/ProgressDialog;->onProgressChanged()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setProgressPercentFormat(Ljava/text/NumberFormat;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/zte/mifavor/widget/ProgressDialog;->mProgressPercentFormat:Ljava/text/NumberFormat;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/zte/mifavor/widget/ProgressDialog;->onProgressChanged()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setProgressStyle(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/zte/mifavor/widget/ProgressDialog;->mProgressStyle:I

    .line 2
    .line 3
    return-void
.end method

.method public setSecondaryProgress(I)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne v0, p1, :cond_0

    .line 3
    .line 4
    const/4 p1, 0x2

    .line 5
    :cond_0
    iget-object v0, p0, Lcom/zte/mifavor/widget/ProgressDialog;->mProgress:Landroid/widget/ProgressBar;

    .line 6
    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    invoke-virtual {v0, p1}, Landroid/widget/ProgressBar;->setSecondaryProgress(I)V

    .line 10
    .line 11
    .line 12
    invoke-direct {p0}, Lcom/zte/mifavor/widget/ProgressDialog;->onProgressChanged()V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_1
    iput p1, p0, Lcom/zte/mifavor/widget/ProgressDialog;->mSecondaryProgressVal:I

    .line 17
    .line 18
    return-void
.end method

.method public show()V
    .locals 1

    .line 13
    invoke-virtual {p0}, Lcom/zte/mifavor/widget/d;->closeSyncGravity()V

    .line 14
    invoke-super {p0}, Lcom/zte/mifavor/widget/d;->show()V

    .line 15
    invoke-direct {p0}, Lcom/zte/mifavor/widget/ProgressDialog;->setMeassageGravity()V

    .line 16
    const-string p0, "Z#DialogProgress"

    const-string v0, "show out."

    invoke-static {p0, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method
