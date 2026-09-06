.class public final synthetic Lcom/android/launcher3/widget/suggest/u;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:Ljava/util/ArrayList;

.field public final synthetic h:Lcom/android/launcher3/C2;


# direct methods
.method public synthetic constructor <init>(Ljava/util/ArrayList;Lcom/android/launcher3/C2;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/widget/suggest/u;->g:Ljava/util/ArrayList;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/launcher3/widget/suggest/u;->h:Lcom/android/launcher3/C2;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/suggest/u;->g:Ljava/util/ArrayList;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/widget/suggest/u;->h:Lcom/android/launcher3/C2;

    .line 4
    .line 5
    invoke-static {v0, p0}, Lcom/android/launcher3/widget/suggest/v;->f(Ljava/util/ArrayList;Lcom/android/launcher3/C2;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
