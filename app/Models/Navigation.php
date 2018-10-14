<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * App\Models\Navigation
 *
 * @property int $id
 * @property string|null $path
 * @property string|null $component
 * @property string|null $redirect
 * @property string|null $name
 * @property string|null $meta
 * @property int|null $pid
 * @property string|null $hidden
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\Navigation whereComponent($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\Navigation whereHidden($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\Navigation whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\Navigation whereMeta($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\Navigation whereName($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\Navigation wherePath($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\Navigation wherePid($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\Navigation whereRedirect($value)
 * @mixin \Eloquent
 */
class Navigation extends Model
{
    //
}
