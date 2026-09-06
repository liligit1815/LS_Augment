.class public Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;
.super Landroid/widget/LinearLayout;
.source "AIFutureWidgetAIOutputLayout.java"

# interfaces
.implements Lcom/android/launcher3/blur/c;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout$AIOutputData;
    }
.end annotation


# instance fields
.field private g:Lcom/android/launcher3/blur/a;

.field private h:Lcom/android/launcher3/widget/custom/CustomWidgetTextView;

.field private i:Landroid/widget/ScrollView;

.field private j:Landroid/view/ViewGroup;

.field private k:I

.field private l:Z

.field private m:Z

.field private n:Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout$AIOutputData;

.field private o:Ljava/lang/Runnable;

.field private p:Landroid/os/Handler;

.field private q:Ljava/lang/String;

.field private r:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 2
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 3
    iput-boolean p1, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;->l:Z

    .line 4
    iput-boolean p1, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;->m:Z

    .line 5
    new-instance p2, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout$c;

    invoke-direct {p2, p0}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout$c;-><init>(Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;)V

    iput-object p2, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;->o:Ljava/lang/Runnable;

    .line 6
    new-instance p2, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object p3

    invoke-direct {p2, p3}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object p2, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;->p:Landroid/os/Handler;

    .line 7
    const-string p2, ""

    iput-object p2, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;->q:Ljava/lang/String;

    .line 8
    iput p1, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;->r:I

    return-void
.end method

.method static bridge synthetic a(Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;)Lcom/android/launcher3/widget/custom/CustomWidgetTextView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;->h:Lcom/android/launcher3/widget/custom/CustomWidgetTextView;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic b(Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;)Landroid/os/Handler;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;->p:Landroid/os/Handler;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic c(Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;->l:Z

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic d(Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;->q:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic e(Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;->r:I

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic f(Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;)Landroid/widget/ScrollView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;->i:Landroid/widget/ScrollView;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic g(Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;->m:Z

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic h(Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;->r:I

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic i(Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;->m:Z

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic j(Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;->k()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private k()V
    .locals 2

    .line 1
    const-string v0, "AIFutureWidgetAIOutputLayout"

    .line 2
    .line 3
    const-string v1, "clearTextAnim"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    const-string v0, ""

    .line 9
    .line 10
    iput-object v0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;->q:Ljava/lang/String;

    .line 11
    .line 12
    const/4 v0, -0x1

    .line 13
    iput v0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;->r:I

    .line 14
    .line 15
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;->p:Landroid/os/Handler;

    .line 16
    .line 17
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;->o:Ljava/lang/Runnable;

    .line 18
    .line 19
    invoke-virtual {v0, p0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method private l()V
    .locals 4

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;->h:Lcom/android/launcher3/widget/custom/CustomWidgetTextView;

    .line 7
    .line 8
    invoke-virtual {v1}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    const-string v1, ""

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    new-instance v2, Ljava/lang/StringBuilder;

    .line 25
    .line 26
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 27
    .line 28
    .line 29
    const-string v3, "doTextAnim startsWith="

    .line 30
    .line 31
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    iget-object v3, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;->n:Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout$AIOutputData;

    .line 35
    .line 36
    iget-object v3, v3, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout$AIOutputData;->text:Ljava/lang/String;

    .line 37
    .line 38
    invoke-virtual {v3, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 39
    .line 40
    .line 41
    move-result v3

    .line 42
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    const-string v3, " curText.length="

    .line 46
    .line 47
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 51
    .line 52
    .line 53
    move-result v3

    .line 54
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v2

    .line 61
    const-string v3, "AIFutureWidgetAIOutputLayout"

    .line 62
    .line 63
    invoke-static {v3, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 64
    .line 65
    .line 66
    invoke-direct {p0}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;->k()V

    .line 67
    .line 68
    .line 69
    iget-object v2, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;->n:Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout$AIOutputData;

    .line 70
    .line 71
    iget-object v2, v2, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout$AIOutputData;->text:Ljava/lang/String;

    .line 72
    .line 73
    invoke-virtual {v2, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 74
    .line 75
    .line 76
    move-result v2

    .line 77
    if-eqz v2, :cond_0

    .line 78
    .line 79
    iget-object v1, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;->n:Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout$AIOutputData;

    .line 80
    .line 81
    iget-object v1, v1, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout$AIOutputData;->text:Ljava/lang/String;

    .line 82
    .line 83
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 84
    .line 85
    .line 86
    move-result v0

    .line 87
    invoke-virtual {v1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    iput-object v0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;->q:Ljava/lang/String;

    .line 92
    .line 93
    goto :goto_0

    .line 94
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;->h:Lcom/android/launcher3/widget/custom/CustomWidgetTextView;

    .line 95
    .line 96
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 97
    .line 98
    .line 99
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;->n:Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout$AIOutputData;

    .line 100
    .line 101
    iget-object v0, v0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout$AIOutputData;->text:Ljava/lang/String;

    .line 102
    .line 103
    iput-object v0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;->q:Ljava/lang/String;

    .line 104
    .line 105
    :goto_0
    const/4 v0, 0x0

    .line 106
    iput v0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;->r:I

    .line 107
    .line 108
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;->p:Landroid/os/Handler;

    .line 109
    .line 110
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;->o:Ljava/lang/Runnable;

    .line 111
    .line 112
    const-wide/16 v1, 0x0

    .line 113
    .line 114
    invoke-virtual {v0, p0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 115
    .line 116
    .line 117
    return-void
.end method

.method private m()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;->q:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget p0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;->r:I

    .line 10
    .line 11
    if-ltz p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method


# virtual methods
.method public dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 3

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    iput-boolean v1, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;->l:Z

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    const/4 v2, 0x2

    .line 16
    if-ne v0, v2, :cond_1

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    const/4 v2, 0x3

    .line 24
    if-eq v0, v2, :cond_2

    .line 25
    .line 26
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-ne v0, v1, :cond_3

    .line 31
    .line 32
    :cond_2
    const/4 v0, 0x0

    .line 33
    iput-boolean v0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;->l:Z

    .line 34
    .line 35
    :cond_3
    :goto_0
    invoke-super {p0, p1}, Landroid/widget/LinearLayout;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    return p0
.end method

.method public getBgBlurImageView()Lcom/android/launcher3/blur/a;
    .locals 1

    .line 1
    invoke-static {}, Lcom/android/launcher3/blur/f;->g()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;->g:Lcom/android/launcher3/blur/a;

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return-object p0
.end method

.method protected n()Z
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;->l:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getMeasuredHeight()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-lez v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;->i:Landroid/widget/ScrollView;

    .line 12
    .line 13
    invoke-virtual {v0}, Landroid/widget/ScrollView;->getHeight()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getMeasuredHeight()I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    iget p0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;->k:I

    .line 22
    .line 23
    mul-int/lit8 p0, p0, 0x2

    .line 24
    .line 25
    sub-int/2addr v1, p0

    .line 26
    if-lt v0, v1, :cond_0

    .line 27
    .line 28
    const/4 p0, 0x1

    .line 29
    return p0

    .line 30
    :cond_0
    const/4 p0, 0x0

    .line 31
    return p0
.end method

.method protected o()V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "onLauncherStopped isDoingTextAnim="

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-direct {p0}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;->m()Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    const-string v1, " mAIOutputData="

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    iget-object v1, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;->n:Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout$AIOutputData;

    .line 24
    .line 25
    if-eqz v1, :cond_0

    .line 26
    .line 27
    invoke-virtual {v1}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout$AIOutputData;->isAvailable()Z

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    if-nez v1, :cond_0

    .line 32
    .line 33
    const/4 v1, 0x1

    .line 34
    goto :goto_0

    .line 35
    :cond_0
    const/4 v1, 0x0

    .line 36
    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    const-string v1, "AIFutureWidgetAIOutputLayout"

    .line 44
    .line 45
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 46
    .line 47
    .line 48
    invoke-direct {p0}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;->m()Z

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    if-eqz v0, :cond_1

    .line 53
    .line 54
    invoke-direct {p0}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;->k()V

    .line 55
    .line 56
    .line 57
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;->n:Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout$AIOutputData;

    .line 58
    .line 59
    if-eqz v0, :cond_1

    .line 60
    .line 61
    invoke-virtual {v0}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout$AIOutputData;->isAvailable()Z

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    if-eqz v0, :cond_1

    .line 66
    .line 67
    const-string v0, "onLauncherStopped isDoingTextAnim setText"

    .line 68
    .line 69
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 70
    .line 71
    .line 72
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;->h:Lcom/android/launcher3/widget/custom/CustomWidgetTextView;

    .line 73
    .line 74
    iget-object v1, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;->n:Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout$AIOutputData;

    .line 75
    .line 76
    iget-object v1, v1, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout$AIOutputData;->text:Ljava/lang/String;

    .line 77
    .line 78
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 79
    .line 80
    .line 81
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;->i:Landroid/widget/ScrollView;

    .line 82
    .line 83
    const/16 v0, 0x82

    .line 84
    .line 85
    invoke-virtual {p0, v0}, Landroid/widget/ScrollView;->fullScroll(I)Z

    .line 86
    .line 87
    .line 88
    :cond_1
    return-void
.end method

.method protected onFinishInflate()V
    .locals 3

    .line 1
    invoke-super {p0}, Landroid/widget/LinearLayout;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    const v1, 0x7f0700a8

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    iput v0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;->k:I

    .line 16
    .line 17
    const v0, 0x7f0b009c

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    check-cast v0, Landroid/view/ViewGroup;

    .line 25
    .line 26
    iput-object v0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;->j:Landroid/view/ViewGroup;

    .line 27
    .line 28
    invoke-static {}, Lcom/android/launcher3/blur/f;->g()Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-eqz v0, :cond_0

    .line 33
    .line 34
    new-instance v0, Lcom/android/launcher3/blur/a;

    .line 35
    .line 36
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-direct {v0, v1, p0}, Lcom/android/launcher3/blur/a;-><init>(Landroid/content/Context;Landroid/view/View;)V

    .line 41
    .line 42
    .line 43
    iput-object v0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;->g:Lcom/android/launcher3/blur/a;

    .line 44
    .line 45
    iget-object v1, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;->j:Landroid/view/ViewGroup;

    .line 46
    .line 47
    const/4 v2, 0x0

    .line 48
    invoke-virtual {v1, v0, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;I)V

    .line 49
    .line 50
    .line 51
    :cond_0
    const v0, 0x7f0b009f

    .line 52
    .line 53
    .line 54
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    check-cast v0, Lcom/android/launcher3/widget/custom/CustomWidgetTextView;

    .line 59
    .line 60
    iput-object v0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;->h:Lcom/android/launcher3/widget/custom/CustomWidgetTextView;

    .line 61
    .line 62
    const v0, 0x7f0b009e

    .line 63
    .line 64
    .line 65
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    check-cast v0, Landroid/widget/ScrollView;

    .line 70
    .line 71
    iput-object v0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;->i:Landroid/widget/ScrollView;

    .line 72
    .line 73
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;->h:Lcom/android/launcher3/widget/custom/CustomWidgetTextView;

    .line 74
    .line 75
    const-string v1, ""

    .line 76
    .line 77
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 78
    .line 79
    .line 80
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;->h:Lcom/android/launcher3/widget/custom/CustomWidgetTextView;

    .line 81
    .line 82
    new-instance v1, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout$a;

    .line 83
    .line 84
    invoke-direct {v1, p0}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout$a;-><init>(Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;)V

    .line 85
    .line 86
    .line 87
    invoke-virtual {v0, v1}, Lcom/android/launcher3/widget/custom/CustomWidgetTextView;->setOnTextColorChangedCallback(Lcom/android/launcher3/widget/custom/CustomWidgetTextView$a;)V

    .line 88
    .line 89
    .line 90
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;->h:Lcom/android/launcher3/widget/custom/CustomWidgetTextView;

    .line 91
    .line 92
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 93
    .line 94
    .line 95
    move-result-object v1

    .line 96
    invoke-static {v1}, Lcom/android/launcher3/N5;->x(Landroid/content/Context;)Z

    .line 97
    .line 98
    .line 99
    move-result v1

    .line 100
    if-eqz v1, :cond_1

    .line 101
    .line 102
    const v1, -0x19000001

    .line 103
    .line 104
    .line 105
    goto :goto_0

    .line 106
    :cond_1
    const/high16 v1, -0x1a000000

    .line 107
    .line 108
    :goto_0
    invoke-virtual {v0, v1}, Lcom/android/launcher3/widget/custom/CustomWidgetTextView;->setTextColor(I)V

    .line 109
    .line 110
    .line 111
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    const v1, 0x7f08075a

    .line 116
    .line 117
    .line 118
    invoke-virtual {v0, v1}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 123
    .line 124
    .line 125
    move-result-object v1

    .line 126
    invoke-static {v1}, Lcom/android/launcher3/N5;->x(Landroid/content/Context;)Z

    .line 127
    .line 128
    .line 129
    move-result v1

    .line 130
    if-eqz v1, :cond_2

    .line 131
    .line 132
    const v1, -0x7fd3d3d4

    .line 133
    .line 134
    .line 135
    goto :goto_1

    .line 136
    :cond_2
    const v1, -0x7f0e0e0f

    .line 137
    .line 138
    .line 139
    :goto_1
    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setTint(I)V

    .line 140
    .line 141
    .line 142
    iget-object v1, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;->g:Lcom/android/launcher3/blur/a;

    .line 143
    .line 144
    if-eqz v1, :cond_3

    .line 145
    .line 146
    invoke-virtual {v1, v0}, Lcom/android/launcher3/blur/a;->setBlurBgTopColorDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 147
    .line 148
    .line 149
    goto :goto_2

    .line 150
    :cond_3
    iget-object v1, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;->j:Landroid/view/ViewGroup;

    .line 151
    .line 152
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 153
    .line 154
    .line 155
    :goto_2
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;->i:Landroid/widget/ScrollView;

    .line 156
    .line 157
    new-instance v1, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout$b;

    .line 158
    .line 159
    invoke-direct {v1, p0}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout$b;-><init>(Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;)V

    .line 160
    .line 161
    .line 162
    invoke-virtual {v0, v1}, Landroid/widget/ScrollView;->setOnScrollChangeListener(Landroid/view/View$OnScrollChangeListener;)V

    .line 163
    .line 164
    .line 165
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 166
    .line 167
    .line 168
    move-result-object v0

    .line 169
    instance-of v0, v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 170
    .line 171
    if-eqz v0, :cond_5

    .line 172
    .line 173
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 174
    .line 175
    .line 176
    move-result-object v0

    .line 177
    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 178
    .line 179
    invoke-static {}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetUtils;->r()Landroid/graphics/Rect;

    .line 180
    .line 181
    .line 182
    move-result-object v1

    .line 183
    iget v2, v1, Landroid/graphics/Rect;->left:I

    .line 184
    .line 185
    iput v2, v0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 186
    .line 187
    iget v2, v1, Landroid/graphics/Rect;->right:I

    .line 188
    .line 189
    iput v2, v0, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 190
    .line 191
    iget v2, v1, Landroid/graphics/Rect;->top:I

    .line 192
    .line 193
    iput v2, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 194
    .line 195
    iget v1, v1, Landroid/graphics/Rect;->bottom:I

    .line 196
    .line 197
    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 198
    .line 199
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 200
    .line 201
    .line 202
    move-result-object v1

    .line 203
    instance-of v1, v1, Lcom/android/launcher3/C2;

    .line 204
    .line 205
    if-eqz v1, :cond_4

    .line 206
    .line 207
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 208
    .line 209
    .line 210
    move-result-object v1

    .line 211
    check-cast v1, Lcom/android/launcher3/C2;

    .line 212
    .line 213
    invoke-virtual {v1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 214
    .line 215
    .line 216
    move-result-object v2

    .line 217
    iget-object v2, v2, Lcom/android/launcher3/h0;->l3:Landroid/graphics/Rect;

    .line 218
    .line 219
    iget v2, v2, Landroid/graphics/Rect;->left:I

    .line 220
    .line 221
    invoke-virtual {v1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 222
    .line 223
    .line 224
    move-result-object v1

    .line 225
    iget v1, v1, Lcom/android/launcher3/X3;->m0:I

    .line 226
    .line 227
    add-int/2addr v2, v1

    .line 228
    iput v2, v0, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 229
    .line 230
    iput v2, v0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 231
    .line 232
    :cond_4
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 233
    .line 234
    .line 235
    :cond_5
    return-void
.end method

.method protected onMeasure(II)V
    .locals 4

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    invoke-super {p0, p1, p2}, Landroid/widget/LinearLayout;->onMeasure(II)V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 9
    .line 10
    .line 11
    move-result-wide p0

    .line 12
    sub-long/2addr p0, v0

    .line 13
    invoke-static {p0, p1}, Ljava/lang/Math;->abs(J)J

    .line 14
    .line 15
    .line 16
    move-result-wide v0

    .line 17
    const-wide/16 v2, 0x5

    .line 18
    .line 19
    cmp-long p2, v0, v2

    .line 20
    .line 21
    if-lez p2, :cond_0

    .line 22
    .line 23
    new-instance p2, Ljava/lang/StringBuilder;

    .line 24
    .line 25
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 26
    .line 27
    .line 28
    const-string v0, "onMeasure hao="

    .line 29
    .line 30
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {p2, p0, p1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    const-string p0, "ms"

    .line 37
    .line 38
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    const-string p1, "AIFutureWidgetAIOutputLayout"

    .line 46
    .line 47
    invoke-static {p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 48
    .line 49
    .line 50
    :cond_0
    return-void
.end method

.method protected p(Ljava/lang/String;)V
    .locals 4

    .line 1
    const-string v0, "AIFutureWidgetAIOutputLayout"

    .line 2
    .line 3
    :try_start_0
    new-instance v1, Lcom/google/gson/f;

    .line 4
    .line 5
    invoke-direct {v1}, Lcom/google/gson/f;-><init>()V

    .line 6
    .line 7
    .line 8
    const-class v2, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout$AIOutputData;

    .line 9
    .line 10
    invoke-virtual {v1, p1, v2}, Lcom/google/gson/f;->j(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    check-cast v1, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout$AIOutputData;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :catchall_0
    move-exception v1

    .line 18
    new-instance v2, Ljava/lang/StringBuilder;

    .line 19
    .line 20
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 21
    .line 22
    .line 23
    const-string v3, "updateByAIOutputData parse aiOutputDataJsonStr error, aiOutputDataJsonStr="

    .line 24
    .line 25
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    invoke-static {v0, v2, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 36
    .line 37
    .line 38
    const/4 v1, 0x0

    .line 39
    :goto_0
    const/4 v2, 0x0

    .line 40
    if-eqz v1, :cond_6

    .line 41
    .line 42
    invoke-virtual {v1}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout$AIOutputData;->isAvailable()Z

    .line 43
    .line 44
    .line 45
    move-result v3

    .line 46
    if-nez v3, :cond_0

    .line 47
    .line 48
    goto/16 :goto_2

    .line 49
    .line 50
    :cond_0
    iget-object p1, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;->n:Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout$AIOutputData;

    .line 51
    .line 52
    invoke-virtual {v1, p1}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout$AIOutputData;->equals(Ljava/lang/Object;)Z

    .line 53
    .line 54
    .line 55
    move-result p1

    .line 56
    if-eqz p1, :cond_1

    .line 57
    .line 58
    new-instance p0, Ljava/lang/StringBuilder;

    .line 59
    .line 60
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 61
    .line 62
    .line 63
    const-string p1, "updateByAIOutputData aiOutputData equals return, aiOutputData="

    .line 64
    .line 65
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 76
    .line 77
    .line 78
    return-void

    .line 79
    :cond_1
    iget-object p1, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;->n:Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout$AIOutputData;

    .line 80
    .line 81
    if-eqz p1, :cond_2

    .line 82
    .line 83
    iget-object p1, p1, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout$AIOutputData;->key:Ljava/lang/String;

    .line 84
    .line 85
    iget-object v3, v1, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout$AIOutputData;->key:Ljava/lang/String;

    .line 86
    .line 87
    invoke-static {p1, v3}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 88
    .line 89
    .line 90
    move-result p1

    .line 91
    if-nez p1, :cond_3

    .line 92
    .line 93
    :cond_2
    new-instance p1, Ljava/lang/StringBuilder;

    .line 94
    .line 95
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 96
    .line 97
    .line 98
    const-string v3, "updateByAIOutputData key changed clear text, mAIOutputData="

    .line 99
    .line 100
    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 101
    .line 102
    .line 103
    iget-object v3, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;->n:Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout$AIOutputData;

    .line 104
    .line 105
    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object p1

    .line 112
    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 113
    .line 114
    .line 115
    iput-boolean v2, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;->m:Z

    .line 116
    .line 117
    iget-object p1, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;->h:Lcom/android/launcher3/widget/custom/CustomWidgetTextView;

    .line 118
    .line 119
    const-string v3, ""

    .line 120
    .line 121
    invoke-virtual {p1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 122
    .line 123
    .line 124
    :cond_3
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 125
    .line 126
    .line 127
    move-result-object p1

    .line 128
    instance-of p1, p1, Lcom/android/launcher3/C2;

    .line 129
    .line 130
    if-eqz p1, :cond_4

    .line 131
    .line 132
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 133
    .line 134
    .line 135
    move-result-object p1

    .line 136
    check-cast p1, Lcom/android/launcher3/C2;

    .line 137
    .line 138
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->T2()Z

    .line 139
    .line 140
    .line 141
    move-result v2

    .line 142
    :cond_4
    iput-object v1, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;->n:Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout$AIOutputData;

    .line 143
    .line 144
    new-instance p1, Ljava/lang/StringBuilder;

    .line 145
    .line 146
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 147
    .line 148
    .line 149
    const-string v3, "updateByAIOutputData isLauncherResumed="

    .line 150
    .line 151
    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 152
    .line 153
    .line 154
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 155
    .line 156
    .line 157
    const-string v2, " getContext="

    .line 158
    .line 159
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 160
    .line 161
    .line 162
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 163
    .line 164
    .line 165
    move-result-object v2

    .line 166
    instance-of v2, v2, Lcom/android/launcher3/C2;

    .line 167
    .line 168
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 169
    .line 170
    .line 171
    const-string v2, " isDoingTextAnim="

    .line 172
    .line 173
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 174
    .line 175
    .line 176
    invoke-direct {p0}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;->m()Z

    .line 177
    .line 178
    .line 179
    move-result v2

    .line 180
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 181
    .line 182
    .line 183
    const-string v2, " aiOutputData="

    .line 184
    .line 185
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 186
    .line 187
    .line 188
    invoke-virtual {v1}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout$AIOutputData;->toStringWithoutNoText()Ljava/lang/String;

    .line 189
    .line 190
    .line 191
    move-result-object v1

    .line 192
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 193
    .line 194
    .line 195
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 196
    .line 197
    .line 198
    move-result-object p1

    .line 199
    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 200
    .line 201
    .line 202
    iget-object p1, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;->n:Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout$AIOutputData;

    .line 203
    .line 204
    iget-boolean p1, p1, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout$AIOutputData;->showTextWithAnim:Z

    .line 205
    .line 206
    if-nez p1, :cond_5

    .line 207
    .line 208
    invoke-direct {p0}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;->k()V

    .line 209
    .line 210
    .line 211
    iget-object p1, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;->h:Lcom/android/launcher3/widget/custom/CustomWidgetTextView;

    .line 212
    .line 213
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;->n:Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout$AIOutputData;

    .line 214
    .line 215
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout$AIOutputData;->text:Ljava/lang/String;

    .line 216
    .line 217
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 218
    .line 219
    .line 220
    goto :goto_1

    .line 221
    :cond_5
    invoke-direct {p0}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;->l()V

    .line 222
    .line 223
    .line 224
    :goto_1
    return-void

    .line 225
    :cond_6
    :goto_2
    new-instance p0, Ljava/lang/StringBuilder;

    .line 226
    .line 227
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 228
    .line 229
    .line 230
    const-string v3, "updateByAIOutputData aiOutputData error return, aiOutputData="

    .line 231
    .line 232
    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 233
    .line 234
    .line 235
    if-eqz v1, :cond_7

    .line 236
    .line 237
    const/4 v2, 0x1

    .line 238
    :cond_7
    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 239
    .line 240
    .line 241
    const-string v1, " aiOutputDataJsonStr="

    .line 242
    .line 243
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 244
    .line 245
    .line 246
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 247
    .line 248
    .line 249
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 250
    .line 251
    .line 252
    move-result-object p0

    .line 253
    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 254
    .line 255
    .line 256
    return-void
.end method

.method protected setAIOutputDataTagTextView(Landroid/widget/TextView;)V
    .locals 3

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;->h:Lcom/android/launcher3/widget/custom/CustomWidgetTextView;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-virtual {p1}, Landroid/widget/TextView;->getTextSize()F

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    invoke-virtual {v0, v1, v2}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;->h:Lcom/android/launcher3/widget/custom/CustomWidgetTextView;

    .line 15
    .line 16
    invoke-virtual {p1}, Landroid/widget/TextView;->getEllipsize()Landroid/text/TextUtils$TruncateAt;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;->h:Lcom/android/launcher3/widget/custom/CustomWidgetTextView;

    .line 24
    .line 25
    invoke-virtual {p1}, Landroid/widget/TextView;->getLineSpacingExtra()F

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    invoke-virtual {p1}, Landroid/widget/TextView;->getLineSpacingMultiplier()F

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    invoke-virtual {p0, v0, p1}, Landroid/widget/TextView;->setLineSpacing(FF)V

    .line 34
    .line 35
    .line 36
    return-void
.end method
