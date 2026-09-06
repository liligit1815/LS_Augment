.class public Lcom/android/launcher3/widget/custom/ai/AICustomWidgetLayout;
.super Landroid/widget/FrameLayout;
.source "AICustomWidgetLayout.java"


# instance fields
.field private g:Ljava/lang/String;

.field private h:Lcom/android/launcher3/widget/custom/ai/AICustomWidgetTopNoticeLayout;

.field private i:Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 2
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 3
    const-string p2, "AICustomWidgetLayout"

    iput-object p2, p0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetLayout;->g:Ljava/lang/String;

    .line 4
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object p3, p0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetLayout;->g:Ljava/lang/String;

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

    iput-object p2, p0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetLayout;->g:Ljava/lang/String;

    .line 5
    const-string p0, "init"

    invoke-static {p2, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    sget-object p0, Lcom/android/launcher3/widget/custom/ai/n;->v:Lcom/android/launcher3/util/I;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p2

    invoke-virtual {p0, p2}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/android/launcher3/widget/custom/ai/n;

    invoke-virtual {p0, p1}, Lcom/android/launcher3/widget/custom/ai/n;->k0(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method protected getBottomEventLayout()Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetLayout;->i:Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout;

    .line 2
    .line 3
    return-object p0
.end method

.method protected getTopNoticeLayout()Lcom/android/launcher3/widget/custom/ai/AICustomWidgetTopNoticeLayout;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetLayout;->h:Lcom/android/launcher3/widget/custom/ai/AICustomWidgetTopNoticeLayout;

    .line 2
    .line 3
    return-object p0
.end method

.method protected onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/widget/FrameLayout;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    const v0, 0x7f0b0099

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetTopNoticeLayout;

    .line 12
    .line 13
    iput-object v0, p0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetLayout;->h:Lcom/android/launcher3/widget/custom/ai/AICustomWidgetTopNoticeLayout;

    .line 14
    .line 15
    invoke-virtual {v0, p0}, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetTopNoticeLayout;->setAICustomWidgetLayout(Lcom/android/launcher3/widget/custom/ai/AICustomWidgetLayout;)V

    .line 16
    .line 17
    .line 18
    const v0, 0x7f0b0091

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout;

    .line 26
    .line 27
    iput-object v0, p0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetLayout;->i:Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout;

    .line 28
    .line 29
    invoke-virtual {v0, p0}, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout;->setAICustomWidgetLayout(Lcom/android/launcher3/widget/custom/ai/AICustomWidgetLayout;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method
