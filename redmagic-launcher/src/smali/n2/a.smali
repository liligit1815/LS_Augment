.class public final synthetic Ln2/a;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Lu4/l;


# instance fields
.field public final synthetic g:Lcom/android/launcher3/util/L1;


# direct methods
.method public synthetic constructor <init>(Lcom/android/launcher3/util/L1;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ln2/a;->g:Lcom/android/launcher3/util/L1;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ln2/a;->g:Lcom/android/launcher3/util/L1;

    .line 2
    .line 3
    check-cast p1, Lm2/g;

    .line 4
    .line 5
    invoke-static {p0, p1}, Ln2/c;->b(Lcom/android/launcher3/util/L1;Lm2/g;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method
