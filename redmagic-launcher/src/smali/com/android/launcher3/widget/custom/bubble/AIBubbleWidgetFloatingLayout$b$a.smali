.class Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$b$a;
.super Ljava/lang/Object;
.source "AIBubbleWidgetFloatingLayout.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$b;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Z

.field final synthetic h:Ljava/lang/String;

.field final synthetic i:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$b;


# direct methods
.method constructor <init>(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$b;ZLjava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$b$a;->i:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$b;

    .line 2
    .line 3
    iput-boolean p2, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$b$a;->g:Z

    .line 4
    .line 5
    iput-object p3, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$b$a;->h:Ljava/lang/String;

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
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$b$a;->i:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$b;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$b;->l:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;

    .line 4
    .line 5
    iget-boolean v1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$b$a;->g:Z

    .line 6
    .line 7
    invoke-static {v0, v1}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;->A(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;Z)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$b$a;->i:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$b;

    .line 11
    .line 12
    iget-object v1, v0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$b;->i:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$ContactMsgZhaiYao;

    .line 13
    .line 14
    iget-object v2, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$b$a;->h:Ljava/lang/String;

    .line 15
    .line 16
    iput-object v2, v1, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$ContactMsgZhaiYao;->zhaiYao:Ljava/lang/String;

    .line 17
    .line 18
    iget-object v1, v0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$b;->l:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;

    .line 19
    .line 20
    iget-object v0, v0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$b;->j:Ljava/lang/String;

    .line 21
    .line 22
    invoke-static {v1, v0}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;->F(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$b$a;->i:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$b;

    .line 26
    .line 27
    iget-object v0, v0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$b;->l:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;

    .line 28
    .line 29
    invoke-static {v0}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;->r(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;)Ljava/util/ArrayList;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    iget-object v1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$b$a;->i:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$b;

    .line 34
    .line 35
    iget-object v1, v1, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$b;->i:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$ContactMsgZhaiYao;

    .line 36
    .line 37
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-ltz v0, :cond_0

    .line 42
    .line 43
    iget-object v1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$b$a;->i:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$b;

    .line 44
    .line 45
    iget-object v1, v1, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$b;->l:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;

    .line 46
    .line 47
    invoke-static {v1}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;->r(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;)Ljava/util/ArrayList;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$b$a;->i:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$b;

    .line 55
    .line 56
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$b;->l:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;

    .line 57
    .line 58
    iget-object v1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$b;->k:Landroid/content/Context;

    .line 59
    .line 60
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$b;->j:Ljava/lang/String;

    .line 61
    .line 62
    invoke-static {v0, v1, p0}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;->G(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;Landroid/content/Context;Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    return-void
.end method
