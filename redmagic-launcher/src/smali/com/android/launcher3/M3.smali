.class public final synthetic Lcom/android/launcher3/M3;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/ToIntFunction;


# instance fields
.field public final synthetic a:[Landroid/database/Cursor;

.field public final synthetic b:[Ljava/lang/String;

.field public final synthetic c:Landroid/util/Pair;

.field public final synthetic d:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>([Landroid/database/Cursor;[Ljava/lang/String;Landroid/util/Pair;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/M3;->a:[Landroid/database/Cursor;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/launcher3/M3;->b:[Ljava/lang/String;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/android/launcher3/M3;->c:Landroid/util/Pair;

    .line 9
    .line 10
    iput-object p4, p0, Lcom/android/launcher3/M3;->d:Ljava/lang/String;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final applyAsInt(Ljava/lang/Object;)I
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/M3;->a:[Landroid/database/Cursor;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/M3;->b:[Ljava/lang/String;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/android/launcher3/M3;->c:Landroid/util/Pair;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/android/launcher3/M3;->d:Ljava/lang/String;

    .line 8
    .line 9
    check-cast p1, Lz1/k2;

    .line 10
    .line 11
    invoke-static {v0, v1, v2, p0, p1}, Lcom/android/launcher3/LauncherProvider;->c([Landroid/database/Cursor;[Ljava/lang/String;Landroid/util/Pair;Ljava/lang/String;Lz1/k2;)I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0
.end method
