.class public final synthetic Lcom/android/launcher3/p;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:Z

.field public final synthetic h:Ljava/util/ArrayList;

.field public final synthetic i:Lcom/android/launcher3/C2;


# direct methods
.method public synthetic constructor <init>(ZLjava/util/ArrayList;Lcom/android/launcher3/C2;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-boolean p1, p0, Lcom/android/launcher3/p;->g:Z

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/launcher3/p;->h:Ljava/util/ArrayList;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/android/launcher3/p;->i:Lcom/android/launcher3/C2;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/p;->g:Z

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/p;->h:Ljava/util/ArrayList;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/android/launcher3/p;->i:Lcom/android/launcher3/C2;

    .line 6
    .line 7
    invoke-static {v0, v1, p0}, Lcom/android/launcher3/o$b;->a(ZLjava/util/ArrayList;Lcom/android/launcher3/C2;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
