.class public Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetLayout;
.super Landroid/widget/FrameLayout;
.source "AIBubbleWidgetLayout.java"


# instance fields
.field private g:Ljava/lang/String;

.field private h:Lcom/android/launcher3/widget/custom/bubble/AIWidgetClockContainer;

.field private i:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;

.field private j:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 2
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 3
    const-string p2, "AIBubbleWidgetLayout"

    iput-object p2, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetLayout;->g:Ljava/lang/String;

    .line 4
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object p3, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetLayout;->g:Ljava/lang/String;

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p3, "{"

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p3

    invoke-static {p3}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p3, "}"

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    iput-object p2, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetLayout;->g:Ljava/lang/String;

    .line 5
    const-string p0, "init"

    invoke-static {p2, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    sget-object p0, Lcom/android/launcher3/widget/custom/bubble/l;->u:Lcom/android/launcher3/util/I;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p2

    invoke-virtual {p0, p2}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/android/launcher3/widget/custom/bubble/l;

    invoke-virtual {p0, p1}, Lcom/android/launcher3/widget/custom/bubble/l;->g0(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method protected getBubbleContainer()Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetLayout;->i:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;

    .line 2
    .line 3
    return-object p0
.end method

.method protected getClockView()Lcom/android/launcher3/widget/custom/bubble/AIWidgetClockContainer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetLayout;->h:Lcom/android/launcher3/widget/custom/bubble/AIWidgetClockContainer;

    .line 2
    .line 3
    return-object p0
.end method

.method protected getFloatingLayout()Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetLayout;->j:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;

    .line 2
    .line 3
    return-object p0
.end method

.method protected onFinishInflate()V
    .locals 4

    .line 1
    invoke-super {p0}, Landroid/widget/FrameLayout;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    const v0, 0x7f0b007e

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Lcom/android/launcher3/widget/custom/bubble/AIWidgetClockContainer;

    .line 12
    .line 13
    iput-object v0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetLayout;->h:Lcom/android/launcher3/widget/custom/bubble/AIWidgetClockContainer;

    .line 14
    .line 15
    const v0, 0x7f0b0076

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    check-cast v0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;

    .line 23
    .line 24
    iput-object v0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetLayout;->i:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;

    .line 25
    .line 26
    invoke-virtual {v0, p0}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->setAIBubbleWidgetLayout(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetLayout;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    instance-of v0, v0, Lcom/android/launcher3/C2;

    .line 34
    .line 35
    if-eqz v0, :cond_0

    .line 36
    .line 37
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    check-cast v0, Lcom/android/launcher3/C2;

    .line 42
    .line 43
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    goto :goto_0

    .line 48
    :cond_0
    move-object v0, p0

    .line 49
    :goto_0
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    const v2, 0x7f0e003f

    .line 58
    .line 59
    .line 60
    const/4 v3, 0x1

    .line 61
    invoke-virtual {v1, v2, v0, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 62
    .line 63
    .line 64
    const v1, 0x7f0b0089

    .line 65
    .line 66
    .line 67
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    check-cast v0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;

    .line 72
    .line 73
    iput-object v0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetLayout;->j:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;

    .line 74
    .line 75
    return-void
.end method
