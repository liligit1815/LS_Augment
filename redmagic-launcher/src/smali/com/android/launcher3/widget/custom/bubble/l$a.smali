.class Lcom/android/launcher3/widget/custom/bubble/l$a;
.super Ljava/lang/Object;
.source "AIBubbleWidgetDataHelper.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/widget/custom/bubble/l;->k0(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/widget/custom/bubble/l;


# direct methods
.method constructor <init>(Lcom/android/launcher3/widget/custom/bubble/l;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/widget/custom/bubble/l$a;->g:Lcom/android/launcher3/widget/custom/bubble/l;

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
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/bubble/l$a;->g:Lcom/android/launcher3/widget/custom/bubble/l;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    const/4 v1, 0x0

    .line 5
    invoke-virtual {p0, v0, v1}, Lcom/android/launcher3/widget/custom/bubble/l;->t(ZLcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetLayout;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
