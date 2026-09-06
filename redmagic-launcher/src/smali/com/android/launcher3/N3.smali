.class public final synthetic Lcom/android/launcher3/N3;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/ToIntFunction;


# instance fields
.field public final synthetic a:Landroid/content/ContentValues;

.field public final synthetic b:Landroid/util/Pair;


# direct methods
.method public synthetic constructor <init>(Landroid/content/ContentValues;Landroid/util/Pair;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/N3;->a:Landroid/content/ContentValues;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/launcher3/N3;->b:Landroid/util/Pair;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final applyAsInt(Ljava/lang/Object;)I
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/N3;->a:Landroid/content/ContentValues;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/N3;->b:Landroid/util/Pair;

    .line 4
    .line 5
    check-cast p1, Lz1/k2;

    .line 6
    .line 7
    invoke-static {v0, p0, p1}, Lcom/android/launcher3/LauncherProvider;->a(Landroid/content/ContentValues;Landroid/util/Pair;Lz1/k2;)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method
