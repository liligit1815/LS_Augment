.class Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$a$a;
.super Ljava/lang/Object;
.source "AIBubbleWidgetFloatingLayout.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$a;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$a;


# direct methods
.method constructor <init>(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$a$a;->g:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$a;

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
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$a$a;->g:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$a;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$a;->g:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-static {v0, v1}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;->x(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$a$a;->g:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$a;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$a;->g:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;->s(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$a$a;->g:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$a;

    .line 20
    .line 21
    iget-object v0, v0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$a;->g:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;

    .line 22
    .line 23
    invoke-static {v0}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;->K(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;)V

    .line 24
    .line 25
    .line 26
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$a$a;->g:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$a;

    .line 27
    .line 28
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$a;->g:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;

    .line 29
    .line 30
    const/4 v0, 0x0

    .line 31
    invoke-static {p0, v0}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;->B(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;Z)V

    .line 32
    .line 33
    .line 34
    return-void
.end method
