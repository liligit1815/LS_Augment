.class Lcom/android/launcher3/widget/custom/ai/n$l;
.super Ljava/lang/Object;
.source "AICustomWidgetDataHelper.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/widget/custom/ai/n;->B(ZLcom/android/launcher3/widget/custom/ai/AICustomWidgetLayout;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/widget/custom/ai/AICustomWidgetLayout;

.field final synthetic h:Lcom/android/launcher3/widget/custom/ai/n;


# direct methods
.method constructor <init>(Lcom/android/launcher3/widget/custom/ai/n;Lcom/android/launcher3/widget/custom/ai/AICustomWidgetLayout;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/widget/custom/ai/n$l;->h:Lcom/android/launcher3/widget/custom/ai/n;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/launcher3/widget/custom/ai/n$l;->g:Lcom/android/launcher3/widget/custom/ai/AICustomWidgetLayout;

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
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/ai/n$l;->h:Lcom/android/launcher3/widget/custom/ai/n;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/launcher3/widget/custom/ai/n;->c(Lcom/android/launcher3/widget/custom/ai/n;)Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Lcom/android/launcher3/widget/custom/ai/n;->t(Landroid/content/Context;)Ljava/util/ArrayList;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    sget-object v1, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 12
    .line 13
    new-instance v2, Lcom/android/launcher3/widget/custom/ai/n$l$a;

    .line 14
    .line 15
    invoke-direct {v2, p0, v0}, Lcom/android/launcher3/widget/custom/ai/n$l$a;-><init>(Lcom/android/launcher3/widget/custom/ai/n$l;Ljava/util/ArrayList;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v1, v2}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method
