.class public final synthetic Lz1/R2;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:Lcom/android/launcher3/D3$a;

.field public final synthetic h:Lz1/y0$b;


# direct methods
.method public synthetic constructor <init>(Lcom/android/launcher3/D3$a;Lz1/y0$b;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lz1/R2;->g:Lcom/android/launcher3/D3$a;

    .line 5
    .line 6
    iput-object p2, p0, Lz1/R2;->h:Lz1/y0$b;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Lz1/R2;->g:Lcom/android/launcher3/D3$a;

    .line 2
    .line 3
    iget-object p0, p0, Lz1/R2;->h:Lz1/y0$b;

    .line 4
    .line 5
    invoke-static {v0, p0}, Lz1/o3;->n(Lcom/android/launcher3/D3$a;Lz1/y0$b;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
