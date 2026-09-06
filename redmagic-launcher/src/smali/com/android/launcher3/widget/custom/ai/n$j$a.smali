.class Lcom/android/launcher3/widget/custom/ai/n$j$a;
.super Ljava/lang/Object;
.source "AICustomWidgetDataHelper.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/widget/custom/ai/n$j;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/widget/custom/ai/data/AIWidgetExpressResult;

.field final synthetic h:Lcom/android/launcher3/widget/custom/ai/n$j;


# direct methods
.method constructor <init>(Lcom/android/launcher3/widget/custom/ai/n$j;Lcom/android/launcher3/widget/custom/ai/data/AIWidgetExpressResult;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/widget/custom/ai/n$j$a;->h:Lcom/android/launcher3/widget/custom/ai/n$j;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/launcher3/widget/custom/ai/n$j$a;->g:Lcom/android/launcher3/widget/custom/ai/data/AIWidgetExpressResult;

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
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/ai/n$j$a;->h:Lcom/android/launcher3/widget/custom/ai/n$j;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/android/launcher3/widget/custom/ai/n$j;->h:Lcom/android/launcher3/widget/custom/ai/AICustomWidgetLayout;

    .line 4
    .line 5
    invoke-static {v0}, Lcom/android/launcher3/widget/custom/ai/n;->n(Lcom/android/launcher3/widget/custom/ai/AICustomWidgetLayout;)Ljava/util/ArrayList;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    check-cast v1, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetLayout;

    .line 24
    .line 25
    invoke-virtual {v1}, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetLayout;->getBottomEventLayout()Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    iget-object v2, p0, Lcom/android/launcher3/widget/custom/ai/n$j$a;->g:Lcom/android/launcher3/widget/custom/ai/data/AIWidgetExpressResult;

    .line 30
    .line 31
    invoke-virtual {v1, v2}, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout;->C(Lcom/android/launcher3/widget/custom/ai/data/AIWidgetExpressResult;)V

    .line 32
    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    return-void
.end method
