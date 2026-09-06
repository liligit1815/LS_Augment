.class public Lcom/android/launcher3/widget/t0;
.super Lcom/android/launcher3/widget/T;
.source "MFVUserLockedAppWidgetHostView.java"


# instance fields
.field private W:Landroid/view/View;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/widget/T;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    invoke-virtual {p0, p1}, Landroid/appwidget/AppWidgetHostView;->setWillNotDraw(Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a0(Lcom/android/launcher3/C2;)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetHostView;->isAttachedToWindow()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetHostView;->getTag()Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    check-cast v0, Lcom/android/launcher3/model/data/A;

    .line 13
    .line 14
    const-string v1, "MFVUserLockedAppWidgetHostView"

    .line 15
    .line 16
    if-nez v0, :cond_1

    .line 17
    .line 18
    const-string p0, "reInflate: info is null."

    .line 19
    .line 20
    invoke-static {v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_1
    new-instance v2, Ljava/lang/StringBuilder;

    .line 25
    .line 26
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 27
    .line 28
    .line 29
    const-string v3, "reInflate: info.providerName:"

    .line 30
    .line 31
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    iget-object v3, v0, Lcom/android/launcher3/model/data/A;->h:Landroid/content/ComponentName;

    .line 35
    .line 36
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    const-string v3, ", widget id: "

    .line 40
    .line 41
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    iget v3, v0, Lcom/android/launcher3/model/data/A;->g:I

    .line 45
    .line 46
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 54
    .line 55
    .line 56
    const/4 v1, 0x0

    .line 57
    const-string v2, "widget removed because of configuration change"

    .line 58
    .line 59
    invoke-virtual {p1, p0, v0, v1, v2}, Lcom/android/launcher3/C2;->o4(Landroid/view/View;Lcom/android/launcher3/model/data/y;ZLjava/lang/String;)Z

    .line 60
    .line 61
    .line 62
    invoke-virtual {p1, v0}, Lcom/android/launcher3/C2;->a1(Lcom/android/launcher3/model/data/A;)V

    .line 63
    .line 64
    .line 65
    return-void
.end method

.method public getDefaultView()Landroid/view/View;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/t0;->W:Landroid/view/View;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/android/launcher3/widget/h;->n:Landroid/view/LayoutInflater;

    .line 6
    .line 7
    const v1, 0x7f0e0072

    .line 8
    .line 9
    .line 10
    const/4 v2, 0x0

    .line 11
    invoke-virtual {v0, v1, p0, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Lcom/android/launcher3/widget/t0;->W:Landroid/view/View;

    .line 16
    .line 17
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/widget/t0;->W:Landroid/view/View;

    .line 18
    .line 19
    return-object p0
.end method
