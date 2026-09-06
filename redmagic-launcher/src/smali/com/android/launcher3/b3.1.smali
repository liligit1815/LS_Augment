.class public final synthetic Lcom/android/launcher3/b3;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:Lcom/android/launcher3/D3;

.field public final synthetic h:Lcom/android/launcher3/D3$d;


# direct methods
.method public synthetic constructor <init>(Lcom/android/launcher3/D3;Lcom/android/launcher3/D3$d;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/b3;->g:Lcom/android/launcher3/D3;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/launcher3/b3;->h:Lcom/android/launcher3/D3$d;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/b3;->g:Lcom/android/launcher3/D3;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/b3;->h:Lcom/android/launcher3/D3$d;

    .line 4
    .line 5
    invoke-static {v0, p0}, Lcom/android/launcher3/D3;->j(Lcom/android/launcher3/D3;Lcom/android/launcher3/D3$d;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
