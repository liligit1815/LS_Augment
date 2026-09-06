.class Lcom/android/launcher3/widget/custom/bubble/l$c;
.super Landroid/content/BroadcastReceiver;
.source "AIBubbleWidgetDataHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/widget/custom/bubble/l;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/android/launcher3/widget/custom/bubble/l;


# direct methods
.method constructor <init>(Lcom/android/launcher3/widget/custom/bubble/l;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/widget/custom/bubble/l$c;->a:Lcom/android/launcher3/widget/custom/bubble/l;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 0

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    goto :goto_0

    .line 8
    :cond_0
    const-string p1, ""

    .line 9
    .line 10
    :goto_0
    const-string p2, "android.intent.action.TIME_TICK"

    .line 11
    .line 12
    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    if-eqz p1, :cond_1

    .line 17
    .line 18
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/bubble/l$c;->a:Lcom/android/launcher3/widget/custom/bubble/l;

    .line 19
    .line 20
    const/4 p1, 0x0

    .line 21
    invoke-static {p0, p1}, Lcom/android/launcher3/widget/custom/bubble/l;->g(Lcom/android/launcher3/widget/custom/bubble/l;Z)V

    .line 22
    .line 23
    .line 24
    :cond_1
    return-void
.end method
