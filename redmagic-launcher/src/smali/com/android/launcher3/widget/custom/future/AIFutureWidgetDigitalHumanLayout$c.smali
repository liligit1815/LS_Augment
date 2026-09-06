.class Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout$c;
.super Ljava/lang/Object;
.source "AIFutureWidgetDigitalHumanLayout.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;->j()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;


# direct methods
.method constructor <init>(Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout$c;->g:Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    :try_start_0
    iget-object v2, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout$c;->g:Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;

    .line 6
    .line 7
    invoke-virtual {v2}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    invoke-static {v2}, Lcn/nubia/redmagickyi/digitalhuman/DigitalHumanManager;->unbindService(Landroid/content/Context;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 12
    .line 13
    .line 14
    goto :goto_0

    .line 15
    :catchall_0
    move-exception v2

    .line 16
    iget-object v3, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout$c;->g:Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;

    .line 17
    .line 18
    invoke-static {v3}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;->a(Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v3

    .line 22
    const-string v4, "clearDigitalHuman unbindService error"

    .line 23
    .line 24
    invoke-static {v3, v4, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 25
    .line 26
    .line 27
    :goto_0
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout$c;->g:Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;

    .line 28
    .line 29
    invoke-static {p0}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;->a(Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    new-instance v2, Ljava/lang/StringBuilder;

    .line 34
    .line 35
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 36
    .line 37
    .line 38
    const-string v3, "clearDigitalHuman unbindService hao="

    .line 39
    .line 40
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 44
    .line 45
    .line 46
    move-result-wide v3

    .line 47
    sub-long/2addr v3, v0

    .line 48
    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    const-string v0, "ms"

    .line 52
    .line 53
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    invoke-static {p0, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 61
    .line 62
    .line 63
    return-void
.end method
