.class Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView$f;
.super Ljava/lang/Object;
.source "AIBubbleWidgetBubbleView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->o(Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;Z)Ljava/util/ArrayList;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;

.field final synthetic h:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;


# direct methods
.method constructor <init>(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView$f;->h:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView$f;->g:Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;

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
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView$f;->h:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView$f;->g:Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->s(Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
