.class Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$l;
.super Ljava/lang/Object;
.source "AIBubbleWidgetFloatingLayout.java"

# interfaces
.implements Landroid/content/ServiceConnection;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;


# direct methods
.method constructor <init>(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$l;->g:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "mKnowledgeService onServiceConnected name="

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    const-string p1, " service="

    .line 15
    .line 16
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    const-string p1, " mKnowledgeDeleteStr="

    .line 23
    .line 24
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    iget-object p1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$l;->g:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;

    .line 28
    .line 29
    invoke-static {p1}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;->p(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    xor-int/lit8 p1, p1, 0x1

    .line 38
    .line 39
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    const-string v0, "AIBubbleWidgetFloatingLayout"

    .line 47
    .line 48
    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 49
    .line 50
    .line 51
    iget-object p1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$l;->g:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;

    .line 52
    .line 53
    invoke-static {p2}, LT3/a$a;->o2(Landroid/os/IBinder;)LT3/a;

    .line 54
    .line 55
    .line 56
    move-result-object p2

    .line 57
    invoke-static {p1, p2}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;->z(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;LT3/a;)V

    .line 58
    .line 59
    .line 60
    iget-object p1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$l;->g:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;

    .line 61
    .line 62
    invoke-static {p1}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;->p(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;)Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 67
    .line 68
    .line 69
    move-result p1

    .line 70
    if-nez p1, :cond_0

    .line 71
    .line 72
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$l;->g:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;

    .line 73
    .line 74
    invoke-static {p0}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;->D(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;)V

    .line 75
    .line 76
    .line 77
    return-void

    .line 78
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$l;->g:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;

    .line 79
    .line 80
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    invoke-static {p0, p1}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;->J(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;Landroid/content/Context;)V

    .line 85
    .line 86
    .line 87
    return-void
.end method

.method public onServiceDisconnected(Landroid/content/ComponentName;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "mKnowledgeService onServiceDisconnected name="

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    const-string v0, "AIBubbleWidgetFloatingLayout"

    .line 19
    .line 20
    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$l;->g:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;

    .line 24
    .line 25
    const/4 p1, 0x0

    .line 26
    invoke-static {p0, p1}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;->z(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;LT3/a;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method
