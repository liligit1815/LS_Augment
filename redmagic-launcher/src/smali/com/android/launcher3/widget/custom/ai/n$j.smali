.class Lcom/android/launcher3/widget/custom/ai/n$j;
.super Ljava/lang/Object;
.source "AICustomWidgetDataHelper.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/widget/custom/ai/n;->v(ZLcom/android/launcher3/widget/custom/ai/AICustomWidgetLayout;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Z

.field final synthetic h:Lcom/android/launcher3/widget/custom/ai/AICustomWidgetLayout;

.field final synthetic i:Lcom/android/launcher3/widget/custom/ai/n;


# direct methods
.method constructor <init>(Lcom/android/launcher3/widget/custom/ai/n;ZLcom/android/launcher3/widget/custom/ai/AICustomWidgetLayout;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/widget/custom/ai/n$j;->i:Lcom/android/launcher3/widget/custom/ai/n;

    .line 2
    .line 3
    iput-boolean p2, p0, Lcom/android/launcher3/widget/custom/ai/n$j;->g:Z

    .line 4
    .line 5
    iput-object p3, p0, Lcom/android/launcher3/widget/custom/ai/n$j;->h:Lcom/android/launcher3/widget/custom/ai/AICustomWidgetLayout;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .line 1
    const-string v0, "AICustomWidgetDataHelper"

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    :try_start_0
    iget-object v2, p0, Lcom/android/launcher3/widget/custom/ai/n$j;->i:Lcom/android/launcher3/widget/custom/ai/n;

    .line 5
    .line 6
    invoke-static {v2}, Lcom/android/launcher3/widget/custom/ai/n;->c(Lcom/android/launcher3/widget/custom/ai/n;)Landroid/content/Context;

    .line 7
    .line 8
    .line 9
    move-result-object v2

    .line 10
    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    invoke-static {}, Lcom/android/launcher3/widget/custom/ai/n;->g()Landroid/net/Uri;

    .line 15
    .line 16
    .line 17
    move-result-object v3

    .line 18
    invoke-virtual {v2, v3}, Landroid/content/ContentResolver;->acquireContentProviderClient(Landroid/net/Uri;)Landroid/content/ContentProviderClient;

    .line 19
    .line 20
    .line 21
    move-result-object v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_3

    .line 22
    :try_start_1
    new-instance v3, Landroid/os/Bundle;

    .line 23
    .line 24
    invoke-direct {v3}, Landroid/os/Bundle;-><init>()V

    .line 25
    .line 26
    .line 27
    const-string v4, "ai_widget_force_refresh"

    .line 28
    .line 29
    iget-boolean v5, p0, Lcom/android/launcher3/widget/custom/ai/n$j;->g:Z

    .line 30
    .line 31
    invoke-virtual {v3, v4, v5}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 32
    .line 33
    .line 34
    const-string v4, "ai_widget_get_express_data"

    .line 35
    .line 36
    invoke-virtual {v2, v4, v1, v3}, Landroid/content/ContentProviderClient;->call(Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)Landroid/os/Bundle;

    .line 37
    .line 38
    .line 39
    move-result-object v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 40
    :try_start_2
    invoke-virtual {v2}, Landroid/content/ContentProviderClient;->close()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 41
    .line 42
    .line 43
    goto :goto_2

    .line 44
    :catchall_0
    move-exception v2

    .line 45
    goto :goto_1

    .line 46
    :catchall_1
    move-exception v3

    .line 47
    if-eqz v2, :cond_0

    .line 48
    .line 49
    :try_start_3
    invoke-virtual {v2}, Landroid/content/ContentProviderClient;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 50
    .line 51
    .line 52
    goto :goto_0

    .line 53
    :catchall_2
    move-exception v2

    .line 54
    :try_start_4
    invoke-virtual {v3, v2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 55
    .line 56
    .line 57
    goto :goto_0

    .line 58
    :catchall_3
    move-exception v2

    .line 59
    move-object v3, v1

    .line 60
    goto :goto_1

    .line 61
    :cond_0
    :goto_0
    throw v3
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_3

    .line 62
    :goto_1
    const-string v4, "asyncGetMiBoardExpressDataAndRefreshViews call error"

    .line 63
    .line 64
    invoke-static {v0, v4, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 65
    .line 66
    .line 67
    :goto_2
    if-eqz v3, :cond_1

    .line 68
    .line 69
    :try_start_5
    const-string v2, "ai_widget_result_express_data"

    .line 70
    .line 71
    const-string v4, ""

    .line 72
    .line 73
    invoke-virtual {v3, v2, v4}, Landroid/os/Bundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v2

    .line 77
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 78
    .line 79
    .line 80
    move-result v3

    .line 81
    if-nez v3, :cond_1

    .line 82
    .line 83
    new-instance v3, Lcom/google/gson/f;

    .line 84
    .line 85
    invoke-direct {v3}, Lcom/google/gson/f;-><init>()V

    .line 86
    .line 87
    .line 88
    const-class v4, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetExpressResult;

    .line 89
    .line 90
    invoke-virtual {v3, v2, v4}, Lcom/google/gson/f;->j(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    .line 91
    .line 92
    .line 93
    move-result-object v2

    .line 94
    check-cast v2, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetExpressResult;
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_4

    .line 95
    .line 96
    move-object v1, v2

    .line 97
    goto :goto_3

    .line 98
    :catchall_4
    move-exception v2

    .line 99
    const-string v3, "asyncGetMiBoardExpressDataAndRefreshViews fromJson error"

    .line 100
    .line 101
    invoke-static {v0, v3, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 102
    .line 103
    .line 104
    :cond_1
    :goto_3
    sget-object v0, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 105
    .line 106
    new-instance v2, Lcom/android/launcher3/widget/custom/ai/n$j$a;

    .line 107
    .line 108
    invoke-direct {v2, p0, v1}, Lcom/android/launcher3/widget/custom/ai/n$j$a;-><init>(Lcom/android/launcher3/widget/custom/ai/n$j;Lcom/android/launcher3/widget/custom/ai/data/AIWidgetExpressResult;)V

    .line 109
    .line 110
    .line 111
    invoke-virtual {v0, v2}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 112
    .line 113
    .line 114
    return-void
.end method
