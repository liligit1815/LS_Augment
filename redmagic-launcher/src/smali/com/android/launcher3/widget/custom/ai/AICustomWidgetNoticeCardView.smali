.class public Lcom/android/launcher3/widget/custom/ai/AICustomWidgetNoticeCardView;
.super Lcom/android/launcher3/widget/custom/ai/r;
.source "AICustomWidgetNoticeCardView.java"


# instance fields
.field private j:Lx1/v;

.field private k:Landroid/view/ViewGroup;

.field private l:Lcom/android/launcher3/widget/custom/ai/AICustomWidgetTopNoticeLayout$b;

.field private m:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/widget/custom/ai/data/AIWidgetNoticeData;",
            ">;"
        }
    .end annotation
.end field

.field private n:Lcom/android/launcher3/widget/custom/ai/r$a;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher3/widget/custom/ai/r;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 3
    .line 4
    .line 5
    new-instance p1, Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object p1, p0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetNoticeCardView;->m:Ljava/util/ArrayList;

    .line 11
    .line 12
    new-instance p1, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetNoticeCardView$a;

    .line 13
    .line 14
    invoke-direct {p1, p0}, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetNoticeCardView$a;-><init>(Lcom/android/launcher3/widget/custom/ai/AICustomWidgetNoticeCardView;)V

    .line 15
    .line 16
    .line 17
    iput-object p1, p0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetNoticeCardView;->n:Lcom/android/launcher3/widget/custom/ai/r$a;

    .line 18
    .line 19
    return-void
.end method

.method static bridge synthetic d(Lcom/android/launcher3/widget/custom/ai/AICustomWidgetNoticeCardView;)Landroid/view/ViewGroup;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetNoticeCardView;->k:Landroid/view/ViewGroup;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic e(Lcom/android/launcher3/widget/custom/ai/AICustomWidgetNoticeCardView;)Lcom/android/launcher3/widget/custom/ai/AICustomWidgetTopNoticeLayout$b;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetNoticeCardView;->l:Lcom/android/launcher3/widget/custom/ai/AICustomWidgetTopNoticeLayout$b;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic f(Lcom/android/launcher3/widget/custom/ai/AICustomWidgetNoticeCardView;)Ljava/util/ArrayList;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetNoticeCardView;->m:Ljava/util/ArrayList;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetNoticeCardView;->j:Lx1/v;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Lx1/v;

    .line 6
    .line 7
    const-string v1, "AICustomWidgetNoticeCardView"

    .line 8
    .line 9
    const/4 v2, 0x1

    .line 10
    invoke-direct {v0, p0, v1, v2}, Lx1/v;-><init>(Landroid/view/View;Ljava/lang/String;Z)V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetNoticeCardView;->j:Lx1/v;

    .line 14
    .line 15
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetNoticeCardView;->j:Lx1/v;

    .line 16
    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    invoke-virtual {v0, p1}, Lx1/v;->g(Landroid/view/MotionEvent;)V

    .line 20
    .line 21
    .line 22
    :cond_1
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    return p0
.end method

.method protected g(Lcom/android/launcher3/widget/custom/ai/AICustomWidgetTopNoticeLayout$b;)V
    .locals 6

    .line 1
    const-string v0, "AICustomWidgetNoticeCardView"

    .line 2
    .line 3
    if-eqz p1, :cond_4

    .line 4
    .line 5
    invoke-virtual {p1}, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetTopNoticeLayout$b;->a()Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-nez v1, :cond_0

    .line 10
    .line 11
    goto :goto_1

    .line 12
    :cond_0
    new-instance v1, Ljava/util/ArrayList;

    .line 13
    .line 14
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 15
    .line 16
    .line 17
    iget-object v2, p1, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetTopNoticeLayout$b;->b:Ljava/util/ArrayList;

    .line 18
    .line 19
    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    :cond_1
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 24
    .line 25
    .line 26
    move-result v3

    .line 27
    if-eqz v3, :cond_3

    .line 28
    .line 29
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v3

    .line 33
    check-cast v3, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetNoticeData;

    .line 34
    .line 35
    invoke-virtual {v3}, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetNoticeData;->isAvailable()Z

    .line 36
    .line 37
    .line 38
    move-result v4

    .line 39
    if-nez v4, :cond_2

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_2
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 43
    .line 44
    .line 45
    move-result v4

    .line 46
    iget v5, p1, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetTopNoticeLayout$b;->c:I

    .line 47
    .line 48
    if-ge v4, v5, :cond_1

    .line 49
    .line 50
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_3
    iput-object p1, p0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetNoticeCardView;->l:Lcom/android/launcher3/widget/custom/ai/AICustomWidgetTopNoticeLayout$b;

    .line 55
    .line 56
    iget-object p1, p0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetNoticeCardView;->m:Ljava/util/ArrayList;

    .line 57
    .line 58
    invoke-virtual {p1}, Ljava/util/ArrayList;->clear()V

    .line 59
    .line 60
    .line 61
    iget-object p1, p0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetNoticeCardView;->m:Ljava/util/ArrayList;

    .line 62
    .line 63
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 64
    .line 65
    .line 66
    new-instance p1, Ljava/lang/StringBuilder;

    .line 67
    .line 68
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 69
    .line 70
    .line 71
    const-string v1, "onBindView mShowDataList="

    .line 72
    .line 73
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    iget-object v1, p0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetNoticeCardView;->m:Ljava/util/ArrayList;

    .line 77
    .line 78
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 79
    .line 80
    .line 81
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 86
    .line 87
    .line 88
    invoke-virtual {p0}, Lcom/android/launcher3/widget/custom/ai/r;->b()V

    .line 89
    .line 90
    .line 91
    return-void

    .line 92
    :cond_4
    :goto_1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 93
    .line 94
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 95
    .line 96
    .line 97
    const-string v1, "onBindView noticeCardData error return, noticeCardData="

    .line 98
    .line 99
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 100
    .line 101
    .line 102
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 103
    .line 104
    .line 105
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object p0

    .line 109
    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 110
    .line 111
    .line 112
    return-void
.end method

.method protected onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/widget/custom/ai/r;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    const v0, 0x7f0b0095

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Landroid/view/ViewGroup;

    .line 12
    .line 13
    iput-object v0, p0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetNoticeCardView;->k:Landroid/view/ViewGroup;

    .line 14
    .line 15
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetNoticeCardView;->n:Lcom/android/launcher3/widget/custom/ai/r$a;

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Lcom/android/launcher3/widget/custom/ai/r;->setCustomCardContainerCallback(Lcom/android/launcher3/widget/custom/ai/r$a;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method
