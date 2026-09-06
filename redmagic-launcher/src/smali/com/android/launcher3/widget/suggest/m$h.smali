.class Lcom/android/launcher3/widget/suggest/m$h;
.super Ljava/lang/Object;
.source "SuggestWidgetHostView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/widget/suggest/m;->q0(Ljava/util/ArrayList;Ljava/util/HashMap;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Ljava/util/ArrayList;

.field final synthetic h:Ljava/util/HashMap;

.field final synthetic i:Z

.field final synthetic j:Lcom/android/launcher3/widget/suggest/m;


# direct methods
.method constructor <init>(Lcom/android/launcher3/widget/suggest/m;Ljava/util/ArrayList;Ljava/util/HashMap;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/widget/suggest/m$h;->j:Lcom/android/launcher3/widget/suggest/m;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/launcher3/widget/suggest/m$h;->g:Ljava/util/ArrayList;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/android/launcher3/widget/suggest/m$h;->h:Ljava/util/HashMap;

    .line 6
    .line 7
    iput-boolean p4, p0, Lcom/android/launcher3/widget/suggest/m$h;->i:Z

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/android/launcher3/widget/suggest/m$h;->j:Lcom/android/launcher3/widget/suggest/m;

    .line 7
    .line 8
    invoke-virtual {v1}, Lcom/android/launcher3/widget/suggest/m;->getSuggestWidgetHostViewTag()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    const-string v1, "createCustomViewList getSuggestCustomView"

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
    const-string v1, "SuggestWidgetHostView"

    .line 25
    .line 26
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 27
    .line 28
    .line 29
    new-instance v0, Ljava/util/HashMap;

    .line 30
    .line 31
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 32
    .line 33
    .line 34
    iget-object v1, p0, Lcom/android/launcher3/widget/suggest/m$h;->g:Ljava/util/ArrayList;

    .line 35
    .line 36
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 41
    .line 42
    .line 43
    move-result v2

    .line 44
    if-eqz v2, :cond_2

    .line 45
    .line 46
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    check-cast v2, Landroid/util/Pair;

    .line 51
    .line 52
    if-eqz v2, :cond_0

    .line 53
    .line 54
    iget-object v3, v2, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 55
    .line 56
    check-cast v3, Ljava/lang/CharSequence;

    .line 57
    .line 58
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 59
    .line 60
    .line 61
    move-result v3

    .line 62
    if-nez v3, :cond_0

    .line 63
    .line 64
    iget-object v3, v2, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 65
    .line 66
    if-nez v3, :cond_1

    .line 67
    .line 68
    goto :goto_0

    .line 69
    :cond_1
    iget-object v3, v2, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 70
    .line 71
    check-cast v3, Ljava/lang/String;

    .line 72
    .line 73
    iget-object v4, p0, Lcom/android/launcher3/widget/suggest/m$h;->j:Lcom/android/launcher3/widget/suggest/m;

    .line 74
    .line 75
    invoke-virtual {v4}, Landroid/appwidget/AppWidgetHostView;->getContext()Landroid/content/Context;

    .line 76
    .line 77
    .line 78
    move-result-object v4

    .line 79
    iget-object v5, p0, Lcom/android/launcher3/widget/suggest/m$h;->j:Lcom/android/launcher3/widget/suggest/m;

    .line 80
    .line 81
    invoke-static {v5}, Lcom/android/launcher3/widget/suggest/m;->h0(Lcom/android/launcher3/widget/suggest/m;)Landroid/os/Handler;

    .line 82
    .line 83
    .line 84
    move-result-object v5

    .line 85
    invoke-static {v4, v3, v5}, Lcom/android/launcher3/widget/suggest/c;->f(Landroid/content/Context;Ljava/lang/String;Landroid/os/Handler;)Landroid/view/View;

    .line 86
    .line 87
    .line 88
    move-result-object v3

    .line 89
    if-eqz v3, :cond_0

    .line 90
    .line 91
    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 92
    .line 93
    .line 94
    goto :goto_0

    .line 95
    :cond_2
    invoke-virtual {v0}, Ljava/util/HashMap;->isEmpty()Z

    .line 96
    .line 97
    .line 98
    move-result v1

    .line 99
    if-nez v1, :cond_3

    .line 100
    .line 101
    sget-object v1, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 102
    .line 103
    new-instance v2, Lcom/android/launcher3/widget/suggest/m$h$a;

    .line 104
    .line 105
    invoke-direct {v2, p0, v0}, Lcom/android/launcher3/widget/suggest/m$h$a;-><init>(Lcom/android/launcher3/widget/suggest/m$h;Ljava/util/HashMap;)V

    .line 106
    .line 107
    .line 108
    invoke-virtual {v1, v2}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 109
    .line 110
    .line 111
    :cond_3
    return-void
.end method
