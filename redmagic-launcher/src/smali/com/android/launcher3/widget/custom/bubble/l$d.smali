.class Lcom/android/launcher3/widget/custom/bubble/l$d;
.super Landroid/database/ContentObserver;
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
.method constructor <init>(Lcom/android/launcher3/widget/custom/bubble/l;Landroid/os/Handler;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/widget/custom/bubble/l$d;->a:Lcom/android/launcher3/widget/custom/bubble/l;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Landroid/database/ContentObserver;-><init>(Landroid/os/Handler;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onChange(Z)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Landroid/database/ContentObserver;->onChange(Z)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/lang/StringBuilder;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 7
    .line 8
    .line 9
    const-string v1, "mSettingsNotificationObserver onChange selfChange="

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    const-string v0, "AIBubbleWidgetDataHelper"

    .line 22
    .line 23
    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 24
    .line 25
    .line 26
    iget-object p1, p0, Lcom/android/launcher3/widget/custom/bubble/l$d;->a:Lcom/android/launcher3/widget/custom/bubble/l;

    .line 27
    .line 28
    const/4 v0, 0x0

    .line 29
    const/4 v1, 0x0

    .line 30
    invoke-virtual {p1, v0, v1}, Lcom/android/launcher3/widget/custom/bubble/l;->t(ZLcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetLayout;)V

    .line 31
    .line 32
    .line 33
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/bubble/l$d;->a:Lcom/android/launcher3/widget/custom/bubble/l;

    .line 34
    .line 35
    invoke-static {p0}, Lcom/android/launcher3/widget/custom/bubble/l;->j(Lcom/android/launcher3/widget/custom/bubble/l;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method
