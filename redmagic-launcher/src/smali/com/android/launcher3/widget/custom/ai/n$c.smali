.class Lcom/android/launcher3/widget/custom/ai/n$c;
.super Ljava/lang/Object;
.source "AICustomWidgetDataHelper.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/widget/custom/ai/n;->A(ZLcom/android/launcher3/widget/custom/ai/AICustomWidgetLayout;)V
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
    iput-object p1, p0, Lcom/android/launcher3/widget/custom/ai/n$c;->h:Lcom/android/launcher3/widget/custom/ai/n;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/launcher3/widget/custom/ai/n$c;->g:Lcom/android/launcher3/widget/custom/ai/AICustomWidgetLayout;

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
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/ai/n$c;->h:Lcom/android/launcher3/widget/custom/ai/n;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/launcher3/widget/custom/ai/n;->e(Lcom/android/launcher3/widget/custom/ai/n;)Ljava/util/ArrayList;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget-object v1, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 8
    .line 9
    new-instance v2, Lcom/android/launcher3/widget/custom/ai/n$c$a;

    .line 10
    .line 11
    invoke-direct {v2, p0, v0}, Lcom/android/launcher3/widget/custom/ai/n$c$a;-><init>(Lcom/android/launcher3/widget/custom/ai/n$c;Ljava/util/ArrayList;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v1, v2}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method
