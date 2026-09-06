.class Lcom/android/launcher3/widget/suggest/m$h$a;
.super Ljava/lang/Object;
.source "SuggestWidgetHostView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/widget/suggest/m$h;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Ljava/util/HashMap;

.field final synthetic h:Lcom/android/launcher3/widget/suggest/m$h;


# direct methods
.method constructor <init>(Lcom/android/launcher3/widget/suggest/m$h;Ljava/util/HashMap;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/widget/suggest/m$h$a;->h:Lcom/android/launcher3/widget/suggest/m$h;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/launcher3/widget/suggest/m$h$a;->g:Ljava/util/HashMap;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/suggest/m$h$a;->h:Lcom/android/launcher3/widget/suggest/m$h;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/android/launcher3/widget/suggest/m$h;->g:Ljava/util/ArrayList;

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_2

    .line 14
    .line 15
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    check-cast v1, Landroid/util/Pair;

    .line 20
    .line 21
    if-eqz v1, :cond_0

    .line 22
    .line 23
    iget-object v2, v1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 24
    .line 25
    check-cast v2, Ljava/lang/CharSequence;

    .line 26
    .line 27
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    if-nez v2, :cond_0

    .line 32
    .line 33
    iget-object v2, v1, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 34
    .line 35
    if-nez v2, :cond_1

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_1
    iget-object v2, p0, Lcom/android/launcher3/widget/suggest/m$h$a;->g:Ljava/util/HashMap;

    .line 39
    .line 40
    invoke-virtual {v2, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    move-result v2

    .line 44
    if-eqz v2, :cond_0

    .line 45
    .line 46
    iget-object v2, v1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 47
    .line 48
    check-cast v2, Ljava/lang/String;

    .line 49
    .line 50
    iget-object v3, p0, Lcom/android/launcher3/widget/suggest/m$h$a;->g:Ljava/util/HashMap;

    .line 51
    .line 52
    invoke-virtual {v3, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object v3

    .line 56
    check-cast v3, Landroid/view/View;

    .line 57
    .line 58
    const v4, 0x7f0b059a

    .line 59
    .line 60
    .line 61
    invoke-virtual {v3, v4, v2}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    .line 62
    .line 63
    .line 64
    new-instance v4, Landroid/view/ViewGroup$LayoutParams;

    .line 65
    .line 66
    const/4 v5, -0x1

    .line 67
    invoke-direct {v4, v5, v5}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 68
    .line 69
    .line 70
    iget-object v5, v1, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 71
    .line 72
    check-cast v5, Landroid/view/ViewGroup;

    .line 73
    .line 74
    iget-object v6, p0, Lcom/android/launcher3/widget/suggest/m$h$a;->g:Ljava/util/HashMap;

    .line 75
    .line 76
    invoke-virtual {v6, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    check-cast v1, Landroid/view/View;

    .line 81
    .line 82
    invoke-virtual {v5, v1, v4}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 83
    .line 84
    .line 85
    iget-object v1, p0, Lcom/android/launcher3/widget/suggest/m$h$a;->h:Lcom/android/launcher3/widget/suggest/m$h;

    .line 86
    .line 87
    iget-object v1, v1, Lcom/android/launcher3/widget/suggest/m$h;->h:Ljava/util/HashMap;

    .line 88
    .line 89
    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 90
    .line 91
    .line 92
    new-instance v1, Ljava/lang/StringBuilder;

    .line 93
    .line 94
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 95
    .line 96
    .line 97
    iget-object v3, p0, Lcom/android/launcher3/widget/suggest/m$h$a;->h:Lcom/android/launcher3/widget/suggest/m$h;

    .line 98
    .line 99
    iget-object v3, v3, Lcom/android/launcher3/widget/suggest/m$h;->j:Lcom/android/launcher3/widget/suggest/m;

    .line 100
    .line 101
    invoke-virtual {v3}, Lcom/android/launcher3/widget/suggest/m;->getSuggestWidgetHostViewTag()Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object v3

    .line 105
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    const-string v3, "createCustomViewList getSuggestCustomView addView, tagText="

    .line 109
    .line 110
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 111
    .line 112
    .line 113
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 114
    .line 115
    .line 116
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 117
    .line 118
    .line 119
    move-result-object v1

    .line 120
    const-string v2, "SuggestWidgetHostView"

    .line 121
    .line 122
    invoke-static {v2, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 123
    .line 124
    .line 125
    goto :goto_0

    .line 126
    :cond_2
    iget-object p0, p0, Lcom/android/launcher3/widget/suggest/m$h$a;->h:Lcom/android/launcher3/widget/suggest/m$h;

    .line 127
    .line 128
    iget-boolean v0, p0, Lcom/android/launcher3/widget/suggest/m$h;->i:Z

    .line 129
    .line 130
    if-eqz v0, :cond_3

    .line 131
    .line 132
    iget-object v0, p0, Lcom/android/launcher3/widget/suggest/m$h;->j:Lcom/android/launcher3/widget/suggest/m;

    .line 133
    .line 134
    iget-object p0, p0, Lcom/android/launcher3/widget/suggest/m$h;->h:Ljava/util/HashMap;

    .line 135
    .line 136
    invoke-static {v0, p0}, Lcom/android/launcher3/widget/suggest/m;->k0(Lcom/android/launcher3/widget/suggest/m;Ljava/util/HashMap;)V

    .line 137
    .line 138
    .line 139
    :cond_3
    return-void
.end method
