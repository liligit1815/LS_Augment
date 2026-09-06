.class Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$k$a;
.super Ljava/lang/Object;
.source "AIBubbleWidgetFloatingLayout.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$k;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Ljava/util/ArrayList;

.field final synthetic h:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$k;


# direct methods
.method constructor <init>(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$k;Ljava/util/ArrayList;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$k$a;->h:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$k;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$k$a;->g:Ljava/util/ArrayList;

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
    .locals 5

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "queryContactQueryService MAIN_EXECUTOR contactMsgZhaiYaoList="

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    iget-object v1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$k$a;->g:Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    const-string v1, "AIBubbleWidgetFloatingLayout"

    .line 25
    .line 26
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 27
    .line 28
    .line 29
    const/4 v0, 0x0

    .line 30
    :goto_0
    iget-object v2, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$k$a;->g:Ljava/util/ArrayList;

    .line 31
    .line 32
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 33
    .line 34
    .line 35
    move-result v2

    .line 36
    if-ge v0, v2, :cond_0

    .line 37
    .line 38
    iget-object v2, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$k$a;->g:Ljava/util/ArrayList;

    .line 39
    .line 40
    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    check-cast v2, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$ContactMsgZhaiYao;

    .line 45
    .line 46
    new-instance v3, Ljava/lang/StringBuilder;

    .line 47
    .line 48
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 49
    .line 50
    .line 51
    const-string v4, "queryContactQueryService contactMsgZhaiYaoList i="

    .line 52
    .line 53
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    const-string v4, ", contactMsgZhaiYao="

    .line 60
    .line 61
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v2

    .line 71
    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 72
    .line 73
    .line 74
    add-int/lit8 v0, v0, 0x1

    .line 75
    .line 76
    goto :goto_0

    .line 77
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$k$a;->h:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$k;

    .line 78
    .line 79
    iget-object v0, v0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$k;->h:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;

    .line 80
    .line 81
    new-instance v1, Ljava/util/ArrayList;

    .line 82
    .line 83
    iget-object v2, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$k$a;->g:Ljava/util/ArrayList;

    .line 84
    .line 85
    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 86
    .line 87
    .line 88
    invoke-static {v0, v1}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;->y(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;Ljava/util/ArrayList;)V

    .line 89
    .line 90
    .line 91
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$k$a;->h:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$k;

    .line 92
    .line 93
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$k;->h:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;

    .line 94
    .line 95
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$k;->g:Landroid/content/Context;

    .line 96
    .line 97
    invoke-static {v0, p0}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;->J(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;Landroid/content/Context;)V

    .line 98
    .line 99
    .line 100
    return-void
.end method
