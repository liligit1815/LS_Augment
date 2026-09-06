.class public final synthetic Ln1/A;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Lcom/android/launcher3/F3;


# instance fields
.field public final synthetic g:Ljava/util/List;

.field public final synthetic h:Ln1/C;


# direct methods
.method public synthetic constructor <init>(Ljava/util/List;Ln1/C;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ln1/A;->g:Ljava/util/List;

    .line 5
    .line 6
    iput-object p2, p0, Ln1/A;->h:Ln1/C;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final onPrefChanged(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ln1/A;->g:Ljava/util/List;

    .line 2
    .line 3
    iget-object p0, p0, Ln1/A;->h:Ln1/C;

    .line 4
    .line 5
    invoke-static {v0, p0, p1}, Ln1/C;->a(Ljava/util/List;Ln1/C;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
