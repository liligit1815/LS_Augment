.class public final synthetic Lcom/android/launcher3/widget/custom/bubble/i;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:Lcom/android/launcher3/widget/custom/bubble/l;

.field public final synthetic h:Ljava/util/ArrayList;

.field public final synthetic i:Z

.field public final synthetic j:Ljava/lang/Runnable;


# direct methods
.method public synthetic constructor <init>(Lcom/android/launcher3/widget/custom/bubble/l;Ljava/util/ArrayList;ZLjava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/widget/custom/bubble/i;->g:Lcom/android/launcher3/widget/custom/bubble/l;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/launcher3/widget/custom/bubble/i;->h:Ljava/util/ArrayList;

    .line 7
    .line 8
    iput-boolean p3, p0, Lcom/android/launcher3/widget/custom/bubble/i;->i:Z

    .line 9
    .line 10
    iput-object p4, p0, Lcom/android/launcher3/widget/custom/bubble/i;->j:Ljava/lang/Runnable;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/bubble/i;->g:Lcom/android/launcher3/widget/custom/bubble/l;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/widget/custom/bubble/i;->h:Ljava/util/ArrayList;

    .line 4
    .line 5
    iget-boolean v2, p0, Lcom/android/launcher3/widget/custom/bubble/i;->i:Z

    .line 6
    .line 7
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/bubble/i;->j:Ljava/lang/Runnable;

    .line 8
    .line 9
    invoke-static {v0, v1, v2, p0}, Lcom/android/launcher3/widget/custom/bubble/l;->c(Lcom/android/launcher3/widget/custom/bubble/l;Ljava/util/ArrayList;ZLjava/lang/Runnable;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
