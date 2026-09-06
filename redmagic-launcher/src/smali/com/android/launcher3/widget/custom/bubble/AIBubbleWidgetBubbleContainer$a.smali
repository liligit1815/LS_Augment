.class Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer$a;
.super Ljava/lang/Object;
.source "AIBubbleWidgetBubbleContainer.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->Q(ZLjava/util/ArrayList;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;

.field final synthetic h:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;


# direct methods
.method constructor <init>(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer$a;->h:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer$a;->g:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;

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
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer$a;->h:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer$a;->g:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;

    .line 5
    .line 6
    invoke-static {v0, v1, p0}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->r(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;ZLcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method
