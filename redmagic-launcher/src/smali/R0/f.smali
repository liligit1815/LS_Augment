.class public final synthetic LR0/f;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:Lkotlin/jvm/internal/C;

.field public final synthetic h:LR0/k;

.field public final synthetic i:I


# direct methods
.method public synthetic constructor <init>(Lkotlin/jvm/internal/C;LR0/k;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LR0/f;->g:Lkotlin/jvm/internal/C;

    .line 5
    .line 6
    iput-object p2, p0, LR0/f;->h:LR0/k;

    .line 7
    .line 8
    iput p3, p0, LR0/f;->i:I

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, LR0/f;->g:Lkotlin/jvm/internal/C;

    .line 2
    .line 3
    iget-object v1, p0, LR0/f;->h:LR0/k;

    .line 4
    .line 5
    iget p0, p0, LR0/f;->i:I

    .line 6
    .line 7
    invoke-static {v0, v1, p0}, LR0/k;->e(Lkotlin/jvm/internal/C;LR0/k;I)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
