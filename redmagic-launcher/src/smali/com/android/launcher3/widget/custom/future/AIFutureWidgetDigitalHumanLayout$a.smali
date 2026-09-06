.class Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout$a;
.super Ljava/lang/Object;
.source "AIFutureWidgetDigitalHumanLayout.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;->l()V
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
    iput-object p1, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout$a;->g:Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;

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
    new-instance v2, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout$a$a;

    .line 6
    .line 7
    invoke-direct {v2, p0}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout$a$a;-><init>(Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout$a;)V

    .line 8
    .line 9
    .line 10
    invoke-static {v2}, Lcn/nubia/redmagickyi/digitalhuman/DigitalHumanManager;->setOnServiceBindCallback(Lcn/nubia/redmagickyi/digitalhuman/DigitalHumanManager$OnServiceBindCallback;)V

    .line 11
    .line 12
    .line 13
    iget-object v2, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout$a;->g:Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;

    .line 14
    .line 15
    invoke-static {v2}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;->c(Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 16
    .line 17
    .line 18
    goto :goto_0

    .line 19
    :catchall_0
    move-exception v2

    .line 20
    iget-object v3, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout$a;->g:Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;

    .line 21
    .line 22
    invoke-static {v3}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;->a(Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v3

    .line 26
    const-string v4, "initDigitalHuman bindService error"

    .line 27
    .line 28
    invoke-static {v3, v4, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 29
    .line 30
    .line 31
    :goto_0
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout$a;->g:Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;

    .line 32
    .line 33
    invoke-static {p0}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;->a(Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    new-instance v2, Ljava/lang/StringBuilder;

    .line 38
    .line 39
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 40
    .line 41
    .line 42
    const-string v3, "initDigitalHuman bindService hao="

    .line 43
    .line 44
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 48
    .line 49
    .line 50
    move-result-wide v3

    .line 51
    sub-long/2addr v3, v0

    .line 52
    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    const-string v0, "ms isReady="

    .line 56
    .line 57
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-static {}, Lcn/nubia/redmagickyi/digitalhuman/DigitalHumanManager;->isReady()Z

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    invoke-static {p0, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 72
    .line 73
    .line 74
    return-void
.end method
