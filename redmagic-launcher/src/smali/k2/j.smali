.class public final synthetic Lk2/j;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Lcom/android/launcher3/util/a2;


# instance fields
.field public final synthetic g:Lk2/k;

.field public final synthetic h:Ljava/lang/Runnable;


# direct methods
.method public synthetic constructor <init>(Lk2/k;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lk2/j;->g:Lk2/k;

    .line 5
    .line 6
    iput-object p2, p0, Lk2/j;->h:Ljava/lang/Runnable;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final close()V
    .locals 1

    .line 1
    iget-object v0, p0, Lk2/j;->g:Lk2/k;

    .line 2
    .line 3
    iget-object p0, p0, Lk2/j;->h:Ljava/lang/Runnable;

    .line 4
    .line 5
    invoke-static {v0, p0}, Lk2/k;->a(Lk2/k;Ljava/lang/Runnable;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
